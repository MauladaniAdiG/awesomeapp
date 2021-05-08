import 'package:app/bloc/repository/photosrepo.dart';
import 'package:app/models/pojo/photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DetailState {
  const DetailState();
}

class DetailInit extends DetailState {
  const DetailInit();
}

class DetailLoading extends DetailState {
  const DetailLoading();
}

class DetailLoadEvent extends DetailState {
  final Photos photos;
  const DetailLoadEvent(this.photos);
}

class DetailLoadError extends DetailState {
  final String message;
  const DetailLoadError(this.message);
}

class DetailNotifier extends StateNotifier<DetailState> {
  PhotosRepo _photosRepo;
  DetailNotifier(this._photosRepo) : super(DetailInit());

  Future<void> backToTheInit() async {
    state = DetailInit();
  }

  Future? getDetail(int id) async {
    try {
      state = DetailLoading();
      final result = await _photosRepo.getDetailPhotos(id);
      if (result != null) {
        state = DetailLoadEvent(result);
      }
    } catch (e) {
      state = DetailLoadError('error $e');
    }
  }
}
