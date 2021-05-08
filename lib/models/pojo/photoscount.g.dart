// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photoscount.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotosCountAdapter extends TypeAdapter<PhotosCount> {
  @override
  final int typeId = 0;

  @override
  PhotosCount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotosCount(
      page: fields[0] as int?,
      perPage: fields[1] as int?,
      photosList: (fields[2] as List?)?.cast<Photos>(),
      totalResult: fields[3] as int?,
      nextPage: fields[4] as String?,
      prevPage: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotosCount obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.perPage)
      ..writeByte(2)
      ..write(obj.photosList)
      ..writeByte(3)
      ..write(obj.totalResult)
      ..writeByte(4)
      ..write(obj.nextPage)
      ..writeByte(5)
      ..write(obj.prevPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotosCountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
