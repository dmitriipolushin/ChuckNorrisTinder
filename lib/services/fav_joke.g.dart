// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavJokeAdapter extends TypeAdapter<FavJoke> {
  @override
  final int typeId = 1;

  @override
  FavJoke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavJoke(
      joke: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavJoke obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.joke);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavJokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
