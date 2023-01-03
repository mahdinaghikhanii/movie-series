// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultItem_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultItemMovieEntityAdapter extends TypeAdapter<ResultItemMovieEntity> {
  @override
  final int typeId = 0;

  @override
  ResultItemMovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultItemMovieEntity(
      fields[0] as bool,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as bool,
      fields[11] as String,
      fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ResultItemMovieEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.video)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultItemMovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
