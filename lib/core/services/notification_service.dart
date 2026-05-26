import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../storage/storage_service.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );
    _initialized = true;
  }

  String _langPrefix() {
    final code = StorageService().profile?.languageCode ?? 'en';
    return code.split('_').first.split('-').first;
  }

  static const _autoCheckinTexts = {
    'zh': '今天已自动签到 ❤️',
    'en': 'Auto checked in today ❤️',
    'es': 'Registro automático hoy ❤️',
    'fr': "Enregistrement auto aujourd'hui ❤️",
    'de': 'Heute automatisch eingecheckt ❤️',
    'pt': 'Check-in automático hoje ❤️',
    'it': 'Check-in automatico oggi ❤️',
    'ja': '今日は自動チェックインしました ❤️',
    'ko': '오늘 자동 체크인 완료 ❤️',
  };

  static const _preWarningTexts = {
    'zh': '嘿，你还好吗？点一下 ❤️',
    'en': 'Hey, are you okay? Tap here ❤️',
    'es': 'Oye, ¿estás bien? Toca aquí ❤️',
    'fr': 'Hé, tu vas bien ? Appuie ici ❤️',
    'de': 'Hey, alles okay? Tippe hier ❤️',
    'pt': 'Ei, tudo bem? Toque aqui ❤️',
    'it': 'Ehi, tutto bene? Tocca qui ❤️',
    'ja': '大丈夫？ここをタップ ❤️',
    'ko': '괜찮아요? 여기를 탭하세요 ❤️',
  };

  static const _reminderTexts = {
    'zh': '别忘了今天签到哦 ❤️',
    'en': "Don't forget to check in today ❤️",
    'es': 'No olvides registrarte hoy ❤️',
    'fr': "N'oublie pas de t'enregistrer aujourd'hui ❤️",
    'de': 'Vergiss nicht, heute einzuchecken ❤️',
    'pt': 'Não esqueça de fazer check-in hoje ❤️',
    'it': 'Non dimenticare il check-in oggi ❤️',
    'ja': '今日のチェックインを忘れずに ❤️',
    'ko': '오늘 체크인 잊지 마세요 ❤️',
  };

  Future<void> showAutoCheckinNotification() async {
    final lang = _langPrefix();
    await _show(
      id: 1,
      title: 'LoveYou',
      body: _autoCheckinTexts[lang] ?? _autoCheckinTexts['en']!,
    );
  }

  Future<void> showPreWarningNotification() async {
    final lang = _langPrefix();
    await _show(
      id: 2,
      title: 'LoveYou',
      body: _preWarningTexts[lang] ?? _preWarningTexts['en']!,
      importance: Importance.high,
      priority: Priority.high,
    );
  }

  Future<void> showCheckinReminderNotification() async {
    final lang = _langPrefix();
    await _show(
      id: 3,
      title: 'LoveYou',
      body: _reminderTexts[lang] ?? _reminderTexts['en']!,
    );
  }

  Future<void> _show({
    required int id,
    required String title,
    required String body,
    Importance importance = Importance.defaultImportance,
    Priority priority = Priority.defaultPriority,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'loveyou_channel',
      'LoveYou Notifications',
      channelDescription: 'Safety check-in notifications',
      importance: importance,
      priority: priority,
      icon: '@mipmap/ic_launcher',
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: importance == Importance.high,
    );

    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
