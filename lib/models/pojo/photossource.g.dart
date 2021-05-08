// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photossource.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotosSourceAdapter extends TypeAdapter<PhotosSource> {
  @override
  final int typeId = 2;

  @override
  PhotosSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotosSource(
      original: fields[0] as String?,
      largeTwo: fields[1] as String?,
      large: fields[2] as String?,
      medium: fields[3] as String?,
      small: fields[4] as String?,
      portrait: fields[5] as String?,
      landscape: fields[6] as String?,
      tiny: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotosSource obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.largeTwo)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.medium)
      ..writeByte(4)
      ..write(obj.small)
      ..writeByte(5)
      ..write(obj.portrait)
      ..writeByte(6)
      ..write(obj.landscape)
      ..writeByte(7)
      ..write(obj.tiny);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotosSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
