import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'app/app_state.dart';
import 'core/storage/storage_service.dart';
import 'core/services/notification_service.dart';
import 'core/services/location_service.dart';
import 'core/services/background_service.dart';
import 'core/services/activity_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await StorageService().init();
  await NotificationService().init();

  try {
    await BackgroundService.init();
    final storage = StorageService();
    if (storage.hasProfile && (storage.profile?.isPurchased ?? false)) {
      await BackgroundService.registerPeriodicTasks();
      try {
        await LocationService().startPeriodicCaching();
      } catch (_) {}
      ActivityService().startMonitoring();
    }
  } catch (e) {
    debugPrint('[main] Background init error: $e');
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const LoveYouApp(),
    ),
  );
}
