import 'package:app/service/serviceapi.dart';

abstract class PhotosRepo {
  Future? getPhotos(int page, int perPage, String nextUrl);
  Future? getDetailPhotos(int id);
}

class PhotosRepoFake implements PhotosRepo {
  @override
  Future? getPhotos(int page, int perPage, String nextUrl) async {
    final result = ServiceApi().getPhotos(page, perPage, nextUrl);
    return result;
  }

  @override
  Future? getDetailPhotos(int id) {
    final result = ServiceApi().getDetailPhotos(id);
    return result;
  }
}
