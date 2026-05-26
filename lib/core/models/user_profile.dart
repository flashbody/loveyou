import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isPurchased;

  @HiveField(2)
  int extraContactSlots;

  @HiveField(3)
  bool isAutoCheckin;

  @HiveField(4)
  int checkinIntervalHours;

  @HiveField(5)
  int inactivityThresholdHours;

  @HiveField(6)
  String? lastMessage;

  @HiveField(7)
  bool isAccessibilityMode;

  @HiveField(8)
  String? languageCode;

  @HiveField(9)
  String? smtpEmail;

  @HiveField(10)
  String? smtpPassword;

  @HiveField(11)
  String? smtpHost;

  @HiveField(12)
  int smtpPort;

  @HiveField(13)
  bool smtpUseSsl;

  UserProfile({
    required this.name,
    this.isPurchased = false,
    this.extraContactSlots = 0,
    this.isAutoCheckin = false,
    this.checkinIntervalHours = 24,
    this.inactivityThresholdHours = 12,
    this.lastMessage,
    this.isAccessibilityMode = false,
    this.languageCode,
    this.smtpEmail,
    this.smtpPassword,
    this.smtpHost,
    this.smtpPort = 465,
    this.smtpUseSsl = true,
  });

  bool get hasSmtpConfig =>
      smtpEmail != null &&
      smtpEmail!.isNotEmpty &&
      smtpPassword != null &&
      smtpPassword!.isNotEmpty;

  int get maxContacts => 1 + extraContactSlots;
}
