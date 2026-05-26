import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/checkin_record.dart';
import '../storage/storage_service.dart';
import '../constants/app_constants.dart';
import 'notification_service.dart';
import 'alert_email_service.dart';

enum ActivityType { stationary, walking, running, driving, unknown }

class ActivityService {
  static final ActivityService _instance = ActivityService._internal();
  factory ActivityService() => _instance;
  ActivityService._internal();

  final StorageService _storage = StorageService();
  Timer? _inactivityTimer;
  Timer? _sosTimer;
  DateTime? _lastActivityTime;
  bool _isMonitoring = false;

  DateTime? get lastActivityTime => _lastActivityTime;
  bool get isMonitoring => _isMonitoring;

  Future<void> startMonitoring() async {
    if (_isMonitoring) return;
    _isMonitoring = true;
    _lastActivityTime = DateTime.now();
    _startInactivityTimer();
    debugPrint('[ActivityService] Monitoring started');
  }

  void stopMonitoring() {
    _isMonitoring = false;
    _inactivityTimer?.cancel();
    _sosTimer?.cancel();
    debugPrint('[ActivityService] Monitoring stopped');
  }

  /// Called by platform-specific activity recognition callbacks
  void onActivityDetected(ActivityType type) {
    if (!_isMonitoring) return;

    if (type == ActivityType.walking || type == ActivityType.running) {
      _lastActivityTime = DateTime.now();
      _resetInactivityTimer();
      _handleAutoCheckin();
    }
  }

  void _handleAutoCheckin() {
    final profile = _storage.profile;
    if (profile == null || !profile.isAutoCheckin) return;

    final lastCheckin = _storage.lastCheckin;
    final now = DateTime.now();

    if (lastCheckin == null || _shouldAutoCheckin(lastCheckin.timestamp, now, profile.checkinIntervalHours)) {
      _storage.addCheckin(CheckinRecord(isAutomatic: true));
      NotificationService().showAutoCheckinNotification();
      debugPrint('[ActivityService] Auto check-in triggered');
    }
  }

  bool _shouldAutoCheckin(DateTime lastCheckin, DateTime now, int intervalHours) {
    final nextDue = lastCheckin.add(Duration(hours: intervalHours));
    final today = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(lastCheckin.year, lastCheckin.month, lastCheckin.day);
    return lastDate.isBefore(today) || now.isAfter(nextDue);
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    final profile = _storage.profile;
    if (profile == null) return;

    final thresholdHours = profile.inactivityThresholdHours;
    final preWarningHours = thresholdHours - AppConstants.preWarningOffsetHours;

    // Pre-warning timer
    _inactivityTimer = Timer(Duration(hours: preWarningHours.clamp(1, 999)), () {
      NotificationService().showPreWarningNotification();
      debugPrint('[ActivityService] Pre-warning at ${preWarningHours}h');

      // Full threshold timer (remaining time)
      _inactivityTimer = Timer(
        const Duration(hours: AppConstants.preWarningOffsetHours),
        _onInactivityThresholdReached,
      );
    });
  }

  void _resetInactivityTimer() {
    _sosTimer?.cancel();
    _sosTimer = null;
    _startInactivityTimer();
  }

  void _onInactivityThresholdReached() {
    debugPrint('[ActivityService] Inactivity threshold reached — sending alert');
    AlertEmailService().sendAlertEmails(AlertLevel.timeout);

    _checkAndStartSOS();
  }

  void _checkAndStartSOS() {
    final lastCheckin = _storage.lastCheckin;
    if (lastCheckin == null) return;

    final daysSinceCheckin = DateTime.now().difference(lastCheckin.timestamp).inDays;

    if (daysSinceCheckin >= AppConstants.sosStartAfterDays) {
      _startSOSLoop();
    } else {
      // Check again in 1 hour
      _sosTimer = Timer(
        const Duration(minutes: AppConstants.sosIntervalMinutes),
        _checkAndStartSOS,
      );
    }
  }

  void _startSOSLoop() {
    debugPrint('[ActivityService] SOS loop started');
    AlertEmailService().sendAlertEmails(AlertLevel.sos);

    _sosTimer?.cancel();
    _sosTimer = Timer.periodic(
      const Duration(minutes: AppConstants.sosIntervalMinutes),
      (_) => AlertEmailService().sendAlertEmails(AlertLevel.sos),
    );
  }

  /// Call when user manually checks in to reset all timers
  void onManualCheckin() {
    _lastActivityTime = DateTime.now();
    _sosTimer?.cancel();
    _sosTimer = null;
    _resetInactivityTimer();
  }

  void dispose() {
    stopMonitoring();
  }
}

