import 'package:app/bloc/repository/photosrepo.dart';
import 'package:app/models/pojo/photos.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

abstract class PhotosState {
  const PhotosState();
}

class PhotosInit extends PhotosState {
  const PhotosInit();
}

class PhotosLoading extends PhotosState {
  const PhotosLoading();
}

class PhotosLoadEvent extends PhotosState {
  final PhotosCount photosCount;
  const PhotosLoadEvent(this.photosCount);
}

class PhotosLoadError extends PhotosState {
  final String message;
  const PhotosLoadError(this.message);
}

class PhotosNotifier extends StateNotifier<PhotosState> {
  PhotosRepo _photosRepo;
  PhotosNotifier(this._photosRepo) : super(PhotosInit());

  Future<void> backToTheInit() async {
    state = PhotosInit();
  }

  Future? getPhotos(int page, int perPage) async {
    try {
      final Box<PhotosCount> box =
          await Hive.openBox<PhotosCount>('photosdata');
      state = PhotosLoading();
      final result = await _photosRepo.getPhotos(page, perPage, '');
      if (result != null) {
        if (box.get('photosfield') != null) {
          state = PhotosLoadEvent(result);
        } else {
          box.put('photosfield', result);
          state = PhotosLoadEvent(result);
        }
        return result;
      } else {
        state = PhotosLoadEvent(box.get('photosfield')!);
        return box.get('photosfield');
      }
    } catch (e) {
      state = PhotosLoadError('error $e');
    }
  }

  Future? getMorePhotos(String newUrl, PhotosCount photosCount) async {
    try {
      final Box<PhotosCount> box =
          await Hive.openBox<PhotosCount>('photosdata');
      if (newUrl.isNotEmpty) {
        final result = await _photosRepo.getPhotos(0, 20, newUrl);
        if (result != null && result.nextPage.isNotEmpty) {
          List<Photos> dummy = List.from(photosCount.photosList!)
            ..addAll(result.photosList!);
          box.put(
              'photosfield',
              PhotosCount(
                  nextPage: result.nextPage,
                  photosList: dummy,
                  page: result.page,
                  perPage: result.perPage,
                  prevPage: result.prevPage,
                  totalResult: result.totalResult));
          state = PhotosLoadEvent(PhotosCount(
              nextPage: result.nextPage,
              photosList: dummy,
              page: result.page,
              perPage: result.perPage,
              prevPage: result.prevPage,
              totalResult: result.totalResult));
          return PhotosCount(
              nextPage: result.nextPage,
              photosList: dummy,
              page: result.page,
              perPage: result.perPage,
              prevPage: result.prevPage,
              totalResult: result.totalResult);
        }
      }
    } catch (e) {
      state = PhotosLoadError('error $e');
    }
  }
}
