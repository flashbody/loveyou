// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 0;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfile(
      name: fields[0] as String,
      isPurchased: fields[1] == true,
      extraContactSlots: (fields[2] as int?) ?? 0,
      isAutoCheckin: fields[3] == true,
      checkinIntervalHours: (fields[4] as int?) ?? 24,
      inactivityThresholdHours: (fields[5] as int?) ?? 12,
      lastMessage: fields[6] as String?,
      isAccessibilityMode: fields[7] == true,
      languageCode: fields[8] as String?,
      smtpEmail: fields[9] as String?,
      smtpPassword: fields[10] as String?,
      smtpHost: fields[11] as String?,
      smtpPort: (fields[12] as int?) ?? 465,
      smtpUseSsl: fields[13] != false,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isPurchased)
      ..writeByte(2)
      ..write(obj.extraContactSlots)
      ..writeByte(3)
      ..write(obj.isAutoCheckin)
      ..writeByte(4)
      ..write(obj.checkinIntervalHours)
      ..writeByte(5)
      ..write(obj.inactivityThresholdHours)
      ..writeByte(6)
      ..write(obj.lastMessage)
      ..writeByte(7)
      ..write(obj.isAccessibilityMode)
      ..writeByte(8)
      ..write(obj.languageCode)
      ..writeByte(9)
      ..write(obj.smtpEmail)
      ..writeByte(10)
      ..write(obj.smtpPassword)
      ..writeByte(11)
      ..write(obj.smtpHost)
      ..writeByte(12)
      ..write(obj.smtpPort)
      ..writeByte(13)
      ..write(obj.smtpUseSsl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
