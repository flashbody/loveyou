import 'package:hive/hive.dart';

part 'cached_location.g.dart';

@HiveType(typeId: 3)
class CachedLocation extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  @HiveField(2)
  String? address;

  @HiveField(3)
  DateTime timestamp;

  CachedLocation({
    required this.latitude,
    required this.longitude,
    this.address,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
