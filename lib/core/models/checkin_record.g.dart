// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckinRecordAdapter extends TypeAdapter<CheckinRecord> {
  @override
  final int typeId = 2;

  @override
  CheckinRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckinRecord(
      timestamp: fields[0] as DateTime?,
      isAutomatic: fields[1] as bool,
      latitude: fields[2] as double?,
      longitude: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckinRecord obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.isAutomatic)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckinRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
