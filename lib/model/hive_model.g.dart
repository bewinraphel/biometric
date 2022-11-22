// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class hivemodelListAdapter extends TypeAdapter<hivemodelList> {
  @override
  final int typeId = 1;

  @override
  hivemodelList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return hivemodelList(
      language: fields[2] as dynamic,
      number1: fields[3] as dynamic,
      number2: fields[4] as dynamic,
      substitle: fields[1] as dynamic,
      title: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, hivemodelList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.substitle)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.number1)
      ..writeByte(4)
      ..write(obj.number2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is hivemodelListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
