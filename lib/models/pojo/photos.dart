import 'package:app/models/pojo/photossource.dart';
import 'package:hive/hive.dart';

part 'photos.g.dart';

@HiveType(typeId: 1)
class Photos {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? width;
  @HiveField(2)
  final int? height;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  final String? photographer;
  @HiveField(5)
  final String? photographerUrl;
  @HiveField(6)
  final int? photographerId;
  @HiveField(7)
  final String? avgColor;
  @HiveField(8)
  final PhotosSource? photosSource;
  const Photos(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.photosSource});

  factory Photos.fromJson(Map<String, dynamic> parseJson) {
    return Photos(
        id: parseJson['id'],
        width: parseJson['width'],
        height: parseJson['height'],
        url: parseJson['url'],
        photographer: parseJson['photographer'],
        photographerUrl: parseJson['photographer_url'],
        photographerId: parseJson['photographer_id'],
        avgColor: parseJson['avg_color'],
        photosSource: PhotosSource.fromJson(parseJson['src']));
  }
}
