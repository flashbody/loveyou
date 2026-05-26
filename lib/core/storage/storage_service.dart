import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';
import '../models/user_profile.dart';
import '../models/emergency_contact.dart';
import '../models/checkin_record.dart';
import '../models/cached_location.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late Box<UserProfile> _profileBox;
  late Box<EmergencyContact> _contactsBox;
  late Box<CheckinRecord> _checkinBox;
  late Box<CachedLocation> _locationBox;

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserProfileAdapter());
    Hive.registerAdapter(EmergencyContactAdapter());
    Hive.registerAdapter(CheckinRecordAdapter());
    Hive.registerAdapter(CachedLocationAdapter());

    _profileBox = await Hive.openBox<UserProfile>(AppConstants.profileBox);
    _contactsBox =
        await Hive.openBox<EmergencyContact>(AppConstants.contactsBox);
    _checkinBox = await Hive.openBox<CheckinRecord>(AppConstants.checkinBox);
    _locationBox = await Hive.openBox<CachedLocation>(AppConstants.locationBox);
  }

  // --- Profile ---

  UserProfile? get profile => _profileBox.get('current');

  Future<void> saveProfile(UserProfile profile) async {
    await _profileBox.put('current', profile);
  }

  bool get hasProfile => _profileBox.containsKey('current');

  // --- Contacts ---

  List<EmergencyContact> get contacts => _contactsBox.values.toList();

  Future<void> addContact(EmergencyContact contact) async {
    await _contactsBox.add(contact);
  }

  Future<void> updateContact(int index, EmergencyContact contact) async {
    await _contactsBox.putAt(index, contact);
  }

  Future<void> deleteContact(int index) async {
    await _contactsBox.deleteAt(index);
  }

  // --- Check-in ---

  List<CheckinRecord> get checkins => _checkinBox.values.toList();

  CheckinRecord? get lastCheckin {
    if (_checkinBox.isEmpty) return null;
    return _checkinBox.values.last;
  }

  Future<void> addCheckin(CheckinRecord record) async {
    await _checkinBox.add(record);
  }

  int get streakDays {
    if (_checkinBox.isEmpty) return 0;

    // Deduplicate: collect unique dates that have at least one check-in
    final dates = <DateTime>{};
    for (final record in _checkinBox.values) {
      dates.add(DateTime(
        record.timestamp.year,
        record.timestamp.month,
        record.timestamp.day,
      ));
    }

    final sortedDates = dates.toList()..sort((a, b) => b.compareTo(a));

    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    // Streak must include today (or yesterday if not yet checked in today)
    if (sortedDates.isEmpty) return 0;

    int streak = 0;
    DateTime expected = today;

    // Allow starting from today or yesterday
    if (sortedDates.first == today) {
      expected = today;
    } else if (sortedDates.first == today.subtract(const Duration(days: 1))) {
      expected = today.subtract(const Duration(days: 1));
    } else {
      return 0;
    }

    for (final date in sortedDates) {
      if (date == expected) {
        streak++;
        expected = expected.subtract(const Duration(days: 1));
      } else if (date.isBefore(expected)) {
        break;
      }
    }

    return streak;
  }

  // --- Location ---

  CachedLocation? get lastLocation {
    if (_locationBox.isEmpty) return null;
    return _locationBox.get('last');
  }

  Future<void> cacheLocation(CachedLocation location) async {
    await _locationBox.put('last', location);
  }
}
