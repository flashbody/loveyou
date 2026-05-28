import 'package:flutter/material.dart';
import '../core/models/user_profile.dart';
import '../core/storage/storage_service.dart';

class AppState extends ChangeNotifier {
  final StorageService _storage = StorageService();

  UserProfile? get profile => _storage.profile;
  bool get hasProfile => _storage.hasProfile;
  bool get isPurchased => profile?.isPurchased ?? false;
  bool get isAccessibilityMode => profile?.isAccessibilityMode ?? false;
  int get streakDays => _storage.streakDays;

  Locale? _locale;
  Locale? get locale => _locale;

  AppState() {
    final saved = profile?.languageCode;
    if (saved != null && saved.isNotEmpty) {
      final parts = saved.replaceAll('-', '_').split('_');
      _locale = parts.length > 1 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
    }
  }

  void setLocale(Locale locale) {
    _locale = locale;
    if (profile != null) {
      profile!.languageCode = locale.toLanguageTag();
      _storage.saveProfile(profile!);
    }
    notifyListeners();
  }

  void toggleAccessibility() {
    if (profile != null) {
      profile!.isAccessibilityMode = !profile!.isAccessibilityMode;
      _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> createProfile(String name) async {
    final p = UserProfile(name: name);
    await _storage.saveProfile(p);
    notifyListeners();
  }

  Future<void> setPurchased() async {
    if (profile != null) {
      profile!.isPurchased = true;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> updateCheckinMode(bool isAuto) async {
    if (profile != null) {
      profile!.isAutoCheckin = isAuto;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> updateCheckinInterval(int hours) async {
    if (profile != null) {
      profile!.checkinIntervalHours = hours;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> updateInactivityThreshold(int hours) async {
    if (profile != null) {
      profile!.inactivityThresholdHours = hours;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> updateLastMessage(String message) async {
    if (profile != null) {
      profile!.lastMessage = message;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  Future<void> addExtraContactSlot() async {
    if (profile != null) {
      profile!.extraContactSlots += 1;
      await _storage.saveProfile(profile!);
      notifyListeners();
    }
  }

  void refresh() => notifyListeners();
}
