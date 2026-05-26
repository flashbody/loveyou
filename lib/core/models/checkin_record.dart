import 'package:hive/hive.dart';

part 'checkin_record.g.dart';

@HiveType(typeId: 2)
class CheckinRecord extends HiveObject {
  @HiveField(0)
  DateTime timestamp;

  @HiveField(1)
  bool isAutomatic;

  @HiveField(2)
  double? latitude;

  @HiveField(3)
  double? longitude;

  CheckinRecord({
    DateTime? timestamp,
    this.isAutomatic = false,
    this.latitude,
    this.longitude,
  }) : timestamp = timestamp ?? DateTime.now();
}
