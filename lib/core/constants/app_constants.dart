class AppConstants {
  AppConstants._();

  static const String appName = 'LoveYou';

  // Check-in
  static const int defaultCheckinIntervalHours = 24;
  static const int minCheckinIntervalHours = 12;
  static const int maxCheckinIntervalHours = 48;

  // Inactivity
  static const int defaultInactivityThresholdHours = 12;
  static const int preWarningOffsetHours = 1;
  static const int minInactivityHours = 4;
  static const int maxInactivityHours = 48;

  // SOS
  static const int sosStartAfterDays = 2;
  static const int sosIntervalMinutes = 60;

  // Location
  static const int locationCacheIntervalHours = 4;

  // Contacts
  static const int defaultContactSlots = 1;
  static const int maxContacts = 50;
  static const double extraContactPrice = 1.99;

  // IAP Product IDs
  static const String iapUnlockProductId = 'com.loveyou.unlock';
  static const String iapExtraContactProductId = 'com.loveyou.extra_contact';

  // Hive Box Names
  static const String profileBox = 'profile';
  static const String contactsBox = 'contacts';
  static const String checkinBox = 'checkins';
  static const String locationBox = 'location';
}
