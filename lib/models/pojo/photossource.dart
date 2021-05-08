import 'package:hive/hive.dart';
part 'photossource.g.dart';

@HiveType(typeId: 2)
class PhotosSource {
  @HiveField(0)
  final String? original;
  @HiveField(1)
  final String? largeTwo;
  @HiveField(2)
  final String? large;
  @HiveField(3)
  final String? medium;
  @HiveField(4)
  final String? small;
  @HiveField(5)
  final String? portrait;
  @HiveField(6)
  final String? landscape;
  @HiveField(7)
  final String? tiny;
  const PhotosSource({
    this.original,
    this.largeTwo,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory PhotosSource.fromJson(Map<String, dynamic> parseJson) {
    return PhotosSource(
        original: parseJson['original'],
        largeTwo: parseJson['large2x'],
        large: parseJson['large'],
        medium: parseJson['medium'],
        small: parseJson['small'],
        portrait: parseJson['portrait'],
        landscape: parseJson['landscape'],
        tiny: parseJson['tiny']);
  }
}
