import 'package:app/models/pojo/photos.dart';
import 'package:hive/hive.dart';
part 'photoscount.g.dart';

@HiveType(typeId: 0)
class PhotosCount {
  @HiveField(0)
  final int? page;
  @HiveField(1)
  final int? perPage;
  @HiveField(2)
  final List<Photos>? photosList;
  @HiveField(3)
  final int? totalResult;
  @HiveField(4)
  final String? nextPage;
  @HiveField(5)
  final String? prevPage;
  const PhotosCount(
      {this.page,
      this.perPage,
      this.photosList,
      this.totalResult,
      this.nextPage,
      this.prevPage});

  factory PhotosCount.fromJson(Map<String, dynamic> parseJson) {
    return PhotosCount(
        page: parseJson['page'],
        perPage: parseJson['per_page'],
        photosList: getListPhotos(parseJson['photos']),
        totalResult: parseJson['tota_result'],
        nextPage:
            parseJson.containsKey('next_page') ? parseJson['next_page'] : '',
        prevPage:
            parseJson.containsKey('prev_page') ? parseJson['prev_page'] : '');
  }

  static List<Photos> getListPhotos(json) {
    var list = json as List;
    List<Photos> dummy = list.map((e) => Photos.fromJson(e)).toList();
    return dummy;
  }
}
