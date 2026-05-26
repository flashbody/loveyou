import 'package:hive/hive.dart';

part 'emergency_contact.g.dart';

@HiveType(typeId: 1)
class EmergencyContact extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  DateTime createdAt;

  EmergencyContact({
    required this.name,
    required this.email,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
