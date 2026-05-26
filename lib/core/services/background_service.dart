import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';
import '../storage/storage_service.dart';
import '../constants/app_constants.dart';
import 'location_service.dart';
import 'notification_service.dart';
import 'alert_email_service.dart';

const String taskCheckinCheck = 'com.loveyou.checkinCheck';
const String taskLocationCache = 'com.loveyou.locationCache';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      await StorageService().init();

      switch (task) {
        case taskCheckinCheck:
          await _handleCheckinCheck();
          break;
        case taskLocationCache:
          await _handleLocationCache();
          break;
      }
    } catch (e) {
      debugPrint('[BackgroundService] Task $task failed: $e');
    }
    return true;
  });
}

Future<void> _handleCheckinCheck() async {
  final storage = StorageService();
  final profile = storage.profile;
  if (profile == null || !profile.isPurchased) return;

  final lastCheckin = storage.lastCheckin;
  if (lastCheckin == null) return;

  final now = DateTime.now();
  final hoursSinceCheckin = now.difference(lastCheckin.timestamp).inHours;
  final daysSinceCheckin = now.difference(lastCheckin.timestamp).inDays;

  final threshold = profile.inactivityThresholdHours;
  final preWarning = threshold - AppConstants.preWarningOffsetHours;

  if (daysSinceCheckin >= AppConstants.sosStartAfterDays) {
    await AlertEmailService().sendAlertEmails(AlertLevel.sos);
    debugPrint('[BackgroundService] SOS email sent');
  } else if (hoursSinceCheckin >= threshold) {
    await AlertEmailService().sendAlertEmails(AlertLevel.timeout);
    debugPrint('[BackgroundService] Timeout email sent');
  } else if (hoursSinceCheckin >= preWarning) {
    await NotificationService().init();
    await NotificationService().showPreWarningNotification();
    debugPrint('[BackgroundService] Pre-warning notification sent');
  }
}

Future<void> _handleLocationCache() async {
  await LocationService().startPeriodicCaching();
  // Single shot — cache once then exit
  await Future.delayed(const Duration(seconds: 5));
  LocationService().stopPeriodicCaching();
}

class BackgroundService {
  static Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  static Future<void> registerPeriodicTasks() async {
    await Workmanager().registerPeriodicTask(
      'checkin-check',
      taskCheckinCheck,
      frequency: const Duration(hours: 1),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    await Workmanager().registerPeriodicTask(
      'location-cache',
      taskLocationCache,
      frequency: const Duration(hours: AppConstants.locationCacheIntervalHours),
      constraints: Constraints(
        networkType: NetworkType.not_required,
      ),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    debugPrint('[BackgroundService] Periodic tasks registered');
  }

  static Future<void> cancelAll() async {
    await Workmanager().cancelAll();
  }
}
