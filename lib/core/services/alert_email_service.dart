import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../storage/storage_service.dart';
import '../models/cached_location.dart';

enum AlertLevel { timeout, sos }

class AlertEmailService {
  static final AlertEmailService _instance = AlertEmailService._internal();
  factory AlertEmailService() => _instance;
  AlertEmailService._internal();

  static const _defaultEmail = 'flashbody@foxmail.com';
  static const _defaultPassword = 'nmgquxzcuohybbjg';

  final StorageService _storage = StorageService();

  bool get _isUserConfigured => _storage.profile?.hasSmtpConfig ?? false;

  String get senderEmail =>
      _isUserConfigured ? _storage.profile!.smtpEmail! : _defaultEmail;

  String get _langPrefix {
    final code = _storage.profile?.languageCode ?? 'en';
    return code.split('_').first.split('-').first;
  }

  SmtpServer _buildSmtpServer() {
    final profile = _storage.profile;

    final String email;
    final String password;
    final String? host;
    final int port;
    final bool ssl;

    if (profile != null && profile.hasSmtpConfig) {
      email = profile.smtpEmail!;
      password = profile.smtpPassword!;
      host = profile.smtpHost;
      port = profile.smtpPort;
      ssl = profile.smtpUseSsl;
    } else {
      email = _defaultEmail;
      password = _defaultPassword;
      host = null;
      port = 465;
      ssl = true;
    }

    if (host != null && host.isNotEmpty) {
      return SmtpServer(host, port: port, ssl: ssl,
          username: email, password: password);
    }

    final domain = email.split('@').last.toLowerCase();
    switch (domain) {
      case 'gmail.com':
        return gmail(email, password);
      case 'qq.com':
      case 'foxmail.com':
        return SmtpServer('smtp.qq.com', port: 465, ssl: true,
            username: email, password: password);
      case '163.com':
        return SmtpServer('smtp.163.com', port: 465, ssl: true,
            username: email, password: password);
      case '126.com':
        return SmtpServer('smtp.126.com', port: 465, ssl: true,
            username: email, password: password);
      case 'outlook.com':
      case 'hotmail.com':
        return SmtpServer('smtp-mail.outlook.com', port: 587, ssl: false,
            username: email, password: password);
      case 'yahoo.com':
        return SmtpServer('smtp.mail.yahoo.com', port: 465, ssl: true,
            username: email, password: password);
      case 'icloud.com':
        return SmtpServer('smtp.mail.me.com', port: 587, ssl: false,
            username: email, password: password);
      default:
        return SmtpServer('smtp.$domain', port: port, ssl: ssl,
            username: email, password: password);
    }
  }

  Future<String?> sendVerifyEmail(String toEmail) async {
    final server = _buildSmtpServer();
    final from = senderEmail;
    final message = Message()
      ..from = Address(from, 'LoveYou')
      ..recipients.add(toEmail)
      ..subject = _t(_verifySubject)
      ..text = _t(_verifyBody);

    try {
      await send(message, server);
      return null;
    } on MailerException catch (e) {
      debugPrint('[EmailService] Verify email failed: $e');
      return e.message;
    } catch (e) {
      debugPrint('[EmailService] Verify email failed: $e');
      return e.toString();
    }
  }

  Future<String?> sendTestEmail() async {
    final server = _buildSmtpServer();
    final from = senderEmail;
    final message = Message()
      ..from = Address(from, 'LoveYou')
      ..recipients.add(from)
      ..subject = _t(_testSubject)
      ..text = _t(_testBody);

    try {
      await send(message, server);
      debugPrint('[EmailService] Test email sent successfully');
      return null;
    } on MailerException catch (e) {
      debugPrint('[EmailService] MailerException: $e');
      final msg = e.toString().toLowerCase();
      if (msg.contains('login fail') ||
          msg.contains('authentication') ||
          msg.contains('password') ||
          msg.contains('credential') ||
          msg.contains('abnormal') ||
          msg.contains('not open')) {
        return 'AUTH_FAIL';
      }
      if (msg.contains('no route') ||
          msg.contains('connection refused') ||
          msg.contains('connection failed') ||
          msg.contains('timed out') ||
          msg.contains('socket')) {
        return 'NETWORK_FAIL';
      }
      return e.message;
    } catch (e) {
      debugPrint('[EmailService] Test email failed: $e');
      final msg = e.toString().toLowerCase();
      if (msg.contains('no route') ||
          msg.contains('connection') ||
          msg.contains('socket') ||
          msg.contains('timed out')) {
        return 'NETWORK_FAIL';
      }
      return e.toString();
    }
  }

  Future<void> sendAlertEmails(AlertLevel level) async {
    final server = _buildSmtpServer();
    final profile = _storage.profile;
    if (profile == null) return;

    final contacts = _storage.contacts;
    if (contacts.isEmpty) return;

    final location = _storage.lastLocation;
    final lastCheckin = _storage.lastCheckin;
    final from = senderEmail;

    for (final contact in contacts) {
      try {
        final message = _buildAlertMessage(
          level: level,
          fromEmail: from,
          userName: profile.name,
          contactName: contact.name,
          contactEmail: contact.email,
          location: location,
          lastCheckinTime: lastCheckin?.timestamp,
          lastMessage: profile.lastMessage,
        );

        await send(message, server);
        debugPrint('[EmailService] ${level.name} email sent to ${contact.email}');
      } catch (e) {
        debugPrint('[EmailService] Failed to send to ${contact.email}: $e');
      }
    }
  }

  Future<void> sendSettingsChangeNotification({
    required String changeDescription,
  }) async {
    final server = _buildSmtpServer();
    final profile = _storage.profile;
    if (profile == null) return;

    final contacts = _storage.contacts;
    final from = senderEmail;

    for (final contact in contacts) {
      try {
        final message = Message()
          ..from = Address(from, 'LoveYou')
          ..recipients.add(contact.email)
          ..subject = _t(_settingsSubject, {'name': profile.name})
          ..text = '${_t(_settingsGreeting, {'name': contact.name})}\n\n'
              '${_t(_settingsChanged, {'name': profile.name})}\n'
              '$changeDescription\n\n'
              '${_t(_autoFooter)}';

        await send(message, server);
      } catch (e) {
        debugPrint('[EmailService] Settings notify failed: $e');
      }
    }
  }

  Message _buildAlertMessage({
    required AlertLevel level,
    required String fromEmail,
    required String userName,
    required String contactName,
    required String contactEmail,
    CachedLocation? location,
    DateTime? lastCheckinTime,
    String? lastMessage,
  }) {
    final isSos = level == AlertLevel.sos;
    final hours = lastCheckinTime != null
        ? DateTime.now().difference(lastCheckinTime).inHours
        : 0;
    final days = lastCheckinTime != null
        ? DateTime.now().difference(lastCheckinTime).inDays
        : 0;

    final locationStr = location?.address ?? _t(_locationUnavailable);
    final checkinStr = lastCheckinTime?.toString().substring(0, 19) ?? _t(_noRecord);

    final subject = isSos
        ? _t(_sosSubject, {'name': userName, 'days': '$days'})
        : _t(_timeoutSubject, {'name': userName, 'hours': '$hours'});

    final body = StringBuffer();
    if (isSos) {
      body.writeln(_t(_sosHeader));
      body.writeln();
      body.writeln(_t(_sosBody, {'name': userName, 'days': '$days'}));
    } else {
      body.writeln(_t(_timeoutGreeting, {'name': contactName}));
      body.writeln();
      body.writeln(_t(_timeoutBody, {'name': userName, 'hours': '$hours'}));
    }
    body.writeln();
    body.writeln(_t(_lastLocation, {'location': locationStr}));
    body.writeln(_t(_lastCheckinTime, {'time': checkinStr}));

    if (lastMessage != null && lastMessage.isNotEmpty) {
      body.writeln();
      body.writeln(_t(_messageHeader, {'name': userName}));
      body.writeln(lastMessage);
      body.writeln('---');
    }

    body.writeln();
    if (isSos) {
      body.writeln(_t(_sosAction, {'name': userName}));
      body.writeln(_t(_sosRepeat, {'name': userName}));
    } else {
      body.writeln(_t(_timeoutAction));
    }
    body.writeln();
    body.writeln(_t(_autoFooter));

    return Message()
      ..from = Address(fromEmail, 'LoveYou')
      ..recipients.add(contactEmail)
      ..subject = subject
      ..text = body.toString();
  }

  Future<void> sendCheckinNotification() async {
    final server = _buildSmtpServer();
    final profile = _storage.profile;
    if (profile == null) return;

    final contacts = _storage.contacts;
    if (contacts.isEmpty) return;

    final from = senderEmail;
    final now = DateTime.now().toString().substring(0, 19);

    for (final contact in contacts) {
      try {
        final message = Message()
          ..from = Address(from, 'LoveYou')
          ..recipients.add(contact.email)
          ..subject = _t(_checkinSubject, {'name': profile.name})
          ..text = '${_t(_checkinGreeting, {'name': contact.name})}\n\n'
              '${_t(_checkinBody, {'name': profile.name, 'time': now})}\n\n'
              '${_t(_autoFooter)}';

        await send(message, server);
        debugPrint('[EmailService] Checkin notification sent to ${contact.email}');
      } catch (e) {
        debugPrint('[EmailService] Checkin notify failed: $e');
      }
    }
  }

  // --- Locale-aware template keys ---

  static const _verifySubject = 'verifySubject';
  static const _verifyBody = 'verifyBody';
  static const _testSubject = 'testSubject';
  static const _testBody = 'testBody';
  static const _checkinSubject = 'checkinSubject';
  static const _checkinGreeting = 'checkinGreeting';
  static const _checkinBody = 'checkinBody';
  static const _settingsSubject = 'settingsSubject';
  static const _settingsGreeting = 'settingsGreeting';
  static const _settingsChanged = 'settingsChanged';
  static const _locationUnavailable = 'locationUnavailable';
  static const _noRecord = 'noRecord';
  static const _sosSubject = 'sosSubject';
  static const _timeoutSubject = 'timeoutSubject';
  static const _sosHeader = 'sosHeader';
  static const _sosBody = 'sosBody';
  static const _timeoutGreeting = 'timeoutGreeting';
  static const _timeoutBody = 'timeoutBody';
  static const _lastLocation = 'lastLocation';
  static const _lastCheckinTime = 'lastCheckinTime';
  static const _messageHeader = 'messageHeader';
  static const _sosAction = 'sosAction';
  static const _sosRepeat = 'sosRepeat';
  static const _timeoutAction = 'timeoutAction';
  static const _autoFooter = 'autoFooter';

  String _t(String key, [Map<String, String>? params]) {
    final lang = _langPrefix;
    final templates = _templates[lang] ?? _templates['en']!;
    var text = templates[key] ?? _templates['en']![key] ?? key;
    params?.forEach((k, v) => text = text.replaceAll('{$k}', v));
    return text;
  }

  static const Map<String, Map<String, String>> _templates = {
    'zh': {
      'verifySubject': '[LoveYou] 邮箱验证',
      'verifyBody': '你好！这是 LoveYou App 的邮箱验证邮件。\n收到此邮件说明该邮箱地址有效，可以正常接收紧急通知。',
      'emailNotConfigured': '未配置邮箱信息',
      'testSubject': '[LoveYou] 邮箱配置测试',
      'testBody': '恭喜！你的 LoveYou 邮箱配置成功。\n当你需要帮助时，邮件会从这个邮箱发出。',
      'checkinSubject': '[LoveYou] {name} 已完成安全签到',
      'checkinGreeting': '{name}，你好：',
      'checkinBody': '{name} 已于 {time} 完成安全签到，一切正常。',
      'settingsSubject': '[LoveYou] {name} 的守护设置已更新',
      'settingsGreeting': '{name}，你好：',
      'settingsChanged': '{name} 更新了 LoveYou 守护设置：',
      'locationUnavailable': '位置不可用',
      'noRecord': '无记录',
      'sosSubject': '🆘 [LoveYou 紧急] {name} 已连续 {days} 天失联',
      'timeoutSubject': '[LoveYou] {name} 已超过 {hours} 小时未签到',
      'sosHeader': '紧急通知！',
      'sosBody': '{name} 已连续 {days} 天未签到，且无任何活动记录。',
      'timeoutGreeting': '{name}，你好：',
      'timeoutBody': '{name} 已超过 {hours} 小时未进行安全签到。',
      'lastLocation': '最后活动位置: {location}',
      'lastCheckinTime': '最后签到时间: {time}',
      'messageHeader': '--- {name} 的留言 ---',
      'sosAction': '请立即联系 {name} 或前往最后已知位置确认安全！',
      'sosRepeat': '此邮件将每小时发送一次，直到 {name} 重新签到。',
      'timeoutAction': '请尽快确认 TA 的安全状况。',
      'autoFooter': '此邮件由 LoveYou App 自动发送。',
    },
    'en': {
      'verifySubject': '[LoveYou] Email Verification',
      'verifyBody': 'Hello! This is a verification email from LoveYou App.\nReceiving this means the email address is valid and can receive emergency notifications.',
      'emailNotConfigured': 'Email not configured',
      'testSubject': '[LoveYou] Email Configuration Test',
      'testBody': 'Congratulations! Your LoveYou email is configured.\nWhen you need help, emails will be sent from this address.',
      'checkinSubject': '[LoveYou] {name} has checked in safely',
      'checkinGreeting': 'Hello {name},',
      'checkinBody': '{name} completed a safety check-in at {time}. Everything is fine.',
      'settingsSubject': '[LoveYou] {name} updated their safety settings',
      'settingsGreeting': 'Hello {name},',
      'settingsChanged': '{name} has updated their LoveYou safety settings:',
      'locationUnavailable': 'Location unavailable',
      'noRecord': 'No record',
      'sosSubject': '🆘 [LoveYou EMERGENCY] {name} has been unreachable for {days} days',
      'timeoutSubject': '[LoveYou] {name} has not checked in for {hours} hours',
      'sosHeader': 'EMERGENCY NOTICE!',
      'sosBody': '{name} has not checked in for {days} days and shows no activity.',
      'timeoutGreeting': 'Hello {name},',
      'timeoutBody': '{name} has not performed a safety check-in for over {hours} hours.',
      'lastLocation': 'Last known location: {location}',
      'lastCheckinTime': 'Last check-in time: {time}',
      'messageHeader': '--- Message from {name} ---',
      'sosAction': 'Please contact {name} immediately or go to their last known location!',
      'sosRepeat': 'This email will be sent every hour until {name} checks in again.',
      'timeoutAction': 'Please verify their safety as soon as possible.',
      'autoFooter': 'This email was sent automatically by LoveYou App.',
    },
    'es': {
      'verifySubject': '[LoveYou] Verificación de correo',
      'verifyBody': '¡Hola! Este es un correo de verificación de LoveYou App.\nRecibir este correo significa que la dirección es válida y puede recibir notificaciones de emergencia.',
      'emailNotConfigured': 'Correo no configurado',
      'testSubject': '[LoveYou] Prueba de configuración de correo',
      'testBody': '¡Felicidades! Tu correo de LoveYou está configurado.\nCuando necesites ayuda, los correos se enviarán desde esta dirección.',
      'checkinSubject': '[LoveYou] {name} ha registrado su seguridad',
      'checkinGreeting': 'Hola {name},',
      'checkinBody': '{name} completó un registro de seguridad a las {time}. Todo está bien.',
      'settingsSubject': '[LoveYou] {name} actualizó su configuración de seguridad',
      'settingsGreeting': 'Hola {name},',
      'settingsChanged': '{name} ha actualizado su configuración de seguridad en LoveYou:',
      'locationUnavailable': 'Ubicación no disponible',
      'noRecord': 'Sin registro',
      'sosSubject': '🆘 [LoveYou EMERGENCIA] {name} lleva {days} días sin contacto',
      'timeoutSubject': '[LoveYou] {name} no se ha registrado en {hours} horas',
      'sosHeader': '¡AVISO DE EMERGENCIA!',
      'sosBody': '{name} no se ha registrado en {days} días y no muestra actividad.',
      'timeoutGreeting': 'Hola {name},',
      'timeoutBody': '{name} no ha realizado un registro de seguridad en más de {hours} horas.',
      'lastLocation': 'Última ubicación conocida: {location}',
      'lastCheckinTime': 'Último registro: {time}',
      'messageHeader': '--- Mensaje de {name} ---',
      'sosAction': '¡Por favor contacta a {name} inmediatamente o ve a su última ubicación!',
      'sosRepeat': 'Este correo se enviará cada hora hasta que {name} se registre.',
      'timeoutAction': 'Por favor verifica su seguridad lo antes posible.',
      'autoFooter': 'Este correo fue enviado automáticamente por LoveYou App.',
    },
    'fr': {
      'verifySubject': '[LoveYou] Vérification d\'email',
      'verifyBody': 'Bonjour ! Ceci est un email de vérification de LoveYou App.\nLe recevoir signifie que l\'adresse est valide et peut recevoir des notifications d\'urgence.',
      'emailNotConfigured': 'Email non configuré',
      'testSubject': '[LoveYou] Test de configuration email',
      'testBody': 'Félicitations ! Votre email LoveYou est configuré.\nEn cas de besoin, les emails seront envoyés depuis cette adresse.',
      'checkinSubject': '[LoveYou] {name} a effectué un check-in de sécurité',
      'checkinGreeting': 'Bonjour {name},',
      'checkinBody': '{name} a effectué un check-in de sécurité à {time}. Tout va bien.',
      'settingsSubject': '[LoveYou] {name} a mis à jour ses paramètres de sécurité',
      'settingsGreeting': 'Bonjour {name},',
      'settingsChanged': '{name} a mis à jour ses paramètres de sécurité LoveYou :',
      'locationUnavailable': 'Position indisponible',
      'noRecord': 'Aucun enregistrement',
      'sosSubject': '🆘 [LoveYou URGENCE] {name} est injoignable depuis {days} jours',
      'timeoutSubject': "[LoveYou] {name} ne s'est pas enregistré depuis {hours} heures",
      'sosHeader': 'AVIS D\'URGENCE !',
      'sosBody': "{name} ne s'est pas enregistré depuis {days} jours et ne montre aucune activité.",
      'timeoutGreeting': 'Bonjour {name},',
      'timeoutBody': "{name} n'a pas effectué d'enregistrement de sécurité depuis plus de {hours} heures.",
      'lastLocation': 'Dernière position connue : {location}',
      'lastCheckinTime': 'Dernier enregistrement : {time}',
      'messageHeader': '--- Message de {name} ---',
      'sosAction': 'Veuillez contacter {name} immédiatement ou vous rendre à sa dernière position !',
      'sosRepeat': "Ce message sera envoyé toutes les heures jusqu'à ce que {name} s'enregistre.",
      'timeoutAction': 'Veuillez vérifier sa sécurité dès que possible.',
      'autoFooter': 'Cet email a été envoyé automatiquement par LoveYou App.',
    },
    'de': {
      'verifySubject': '[LoveYou] E-Mail-Verifizierung',
      'verifyBody': 'Hallo! Dies ist eine Verifizierungs-E-Mail von LoveYou App.\nDer Empfang bedeutet, dass die Adresse gültig ist und Notfallbenachrichtigungen empfangen kann.',
      'emailNotConfigured': 'E-Mail nicht konfiguriert',
      'testSubject': '[LoveYou] E-Mail-Konfigurationstest',
      'testBody': 'Herzlichen Glückwunsch! Deine LoveYou E-Mail ist konfiguriert.\nBei Bedarf werden E-Mails von dieser Adresse gesendet.',
      'checkinSubject': '[LoveYou] {name} hat einen Sicherheits-Check-in durchgeführt',
      'checkinGreeting': 'Hallo {name},',
      'checkinBody': '{name} hat um {time} einen Sicherheits-Check-in durchgeführt. Alles in Ordnung.',
      'settingsSubject': '[LoveYou] {name} hat die Sicherheitseinstellungen aktualisiert',
      'settingsGreeting': 'Hallo {name},',
      'settingsChanged': '{name} hat die LoveYou Sicherheitseinstellungen aktualisiert:',
      'locationUnavailable': 'Standort nicht verfügbar',
      'noRecord': 'Kein Eintrag',
      'sosSubject': '🆘 [LoveYou NOTFALL] {name} ist seit {days} Tagen unerreichbar',
      'timeoutSubject': '[LoveYou] {name} hat sich seit {hours} Stunden nicht eingecheckt',
      'sosHeader': 'NOTFALL-MELDUNG!',
      'sosBody': '{name} hat sich seit {days} Tagen nicht eingecheckt und zeigt keine Aktivität.',
      'timeoutGreeting': 'Hallo {name},',
      'timeoutBody': '{name} hat seit über {hours} Stunden keinen Sicherheits-Check-in durchgeführt.',
      'lastLocation': 'Letzter bekannter Standort: {location}',
      'lastCheckinTime': 'Letzter Check-in: {time}',
      'messageHeader': '--- Nachricht von {name} ---',
      'sosAction': 'Bitte kontaktiere {name} sofort oder begib dich zum letzten bekannten Standort!',
      'sosRepeat': 'Diese E-Mail wird stündlich gesendet, bis {name} sich wieder eincheckt.',
      'timeoutAction': 'Bitte überprüfe so schnell wie möglich die Sicherheit.',
      'autoFooter': 'Diese E-Mail wurde automatisch von LoveYou App gesendet.',
    },
    'ja': {
      'verifySubject': '[LoveYou] メールアドレス確認',
      'verifyBody': 'こんにちは！LoveYou Appからのメールアドレス確認メールです。\nこのメールを受信できれば、このアドレスは有効で緊急通知を受信できます。',
      'emailNotConfigured': 'メール未設定',
      'testSubject': '[LoveYou] メール設定テスト',
      'testBody': 'おめでとうございます！LoveYouのメール設定が完了しました。\n必要な時、このアドレスからメールが送信されます。',
      'checkinSubject': '[LoveYou] {name} が安全チェックインを完了しました',
      'checkinGreeting': '{name} さん、こんにちは。',
      'checkinBody': '{name} は {time} に安全チェックインを完了しました。問題ありません。',
      'settingsSubject': '[LoveYou] {name} が安全設定を更新しました',
      'settingsGreeting': '{name} さん、こんにちは。',
      'settingsChanged': '{name} がLoveYouの安全設定を更新しました：',
      'locationUnavailable': '位置情報が利用できません',
      'noRecord': '記録なし',
      'sosSubject': '🆘 [LoveYou 緊急] {name} が{days}日間連絡不通です',
      'timeoutSubject': '[LoveYou] {name} が{hours}時間チェックインしていません',
      'sosHeader': '緊急通知！',
      'sosBody': '{name} は{days}日間チェックインしておらず、活動の記録がありません。',
      'timeoutGreeting': '{name} さん、こんにちは。',
      'timeoutBody': '{name} は{hours}時間以上セーフティチェックインを行っていません。',
      'lastLocation': '最後の位置: {location}',
      'lastCheckinTime': '最後のチェックイン: {time}',
      'messageHeader': '--- {name} からのメッセージ ---',
      'sosAction': '至急 {name} に連絡するか、最後の既知の場所に向かってください！',
      'sosRepeat': 'このメールは {name} がチェックインするまで1時間ごとに送信されます。',
      'timeoutAction': 'できるだけ早く安全を確認してください。',
      'autoFooter': 'このメールはLoveYou Appから自動送信されました。',
    },
    'ko': {
      'verifySubject': '[LoveYou] 이메일 인증',
      'verifyBody': '안녕하세요! LoveYou App의 이메일 인증 메일입니다.\n이 메일을 수신하셨다면 해당 주소로 긴급 알림을 받을 수 있습니다.',
      'emailNotConfigured': '이메일 미설정',
      'testSubject': '[LoveYou] 이메일 설정 테스트',
      'testBody': '축하합니다! LoveYou 이메일이 설정되었습니다.\n도움이 필요할 때 이 주소로 이메일이 발송됩니다.',
      'checkinSubject': '[LoveYou] {name} 님이 안전 체크인을 완료했습니다',
      'checkinGreeting': '{name} 님, 안녕하세요.',
      'checkinBody': '{name} 님이 {time}에 안전 체크인을 완료했습니다. 모든 것이 정상입니다.',
      'settingsSubject': '[LoveYou] {name} 님이 안전 설정을 업데이트했습니다',
      'settingsGreeting': '{name} 님, 안녕하세요.',
      'settingsChanged': '{name} 님이 LoveYou 안전 설정을 업데이트했습니다:',
      'locationUnavailable': '위치를 사용할 수 없음',
      'noRecord': '기록 없음',
      'sosSubject': '🆘 [LoveYou 긴급] {name} 님이 {days}일째 연락 두절입니다',
      'timeoutSubject': '[LoveYou] {name} 님이 {hours}시간 동안 체크인하지 않았습니다',
      'sosHeader': '긴급 알림!',
      'sosBody': '{name} 님이 {days}일 동안 체크인하지 않았으며 활동 기록이 없습니다.',
      'timeoutGreeting': '{name} 님, 안녕하세요.',
      'timeoutBody': '{name} 님이 {hours}시간 이상 안전 체크인을 하지 않았습니다.',
      'lastLocation': '마지막 위치: {location}',
      'lastCheckinTime': '마지막 체크인: {time}',
      'messageHeader': '--- {name} 님의 메시지 ---',
      'sosAction': '{name} 님에게 즉시 연락하거나 마지막 위치로 이동하세요!',
      'sosRepeat': '이 이메일은 {name} 님이 다시 체크인할 때까지 매시간 발송됩니다.',
      'timeoutAction': '가능한 한 빨리 안전을 확인해 주세요.',
      'autoFooter': '이 이메일은 LoveYou App에서 자동 발송되었습니다.',
    },
    'pt': {
      'verifySubject': '[LoveYou] Verificação de email',
      'verifyBody': 'Olá! Este é um email de verificação do LoveYou App.\nReceber este email significa que o endereço é válido e pode receber notificações de emergência.',
      'emailNotConfigured': 'Email não configurado',
      'testSubject': '[LoveYou] Teste de configuração de email',
      'testBody': 'Parabéns! Seu email do LoveYou está configurado.\nQuando precisar de ajuda, os emails serão enviados deste endereço.',
      'checkinSubject': '[LoveYou] {name} fez check-in de segurança',
      'checkinGreeting': 'Olá {name},',
      'checkinBody': '{name} completou um check-in de segurança às {time}. Tudo está bem.',
      'settingsSubject': '[LoveYou] {name} atualizou as configurações de segurança',
      'settingsGreeting': 'Olá {name},',
      'settingsChanged': '{name} atualizou as configurações de segurança do LoveYou:',
      'locationUnavailable': 'Localização indisponível',
      'noRecord': 'Sem registro',
      'sosSubject': '🆘 [LoveYou EMERGÊNCIA] {name} está sem contato há {days} dias',
      'timeoutSubject': '[LoveYou] {name} não fez check-in há {hours} horas',
      'sosHeader': 'AVISO DE EMERGÊNCIA!',
      'sosBody': '{name} não fez check-in há {days} dias e não mostra atividade.',
      'timeoutGreeting': 'Olá {name},',
      'timeoutBody': '{name} não realizou check-in de segurança há mais de {hours} horas.',
      'lastLocation': 'Última localização conhecida: {location}',
      'lastCheckinTime': 'Último check-in: {time}',
      'messageHeader': '--- Mensagem de {name} ---',
      'sosAction': 'Por favor entre em contato com {name} imediatamente ou vá à última localização!',
      'sosRepeat': 'Este email será enviado a cada hora até {name} fazer check-in.',
      'timeoutAction': 'Por favor verifique a segurança o mais rápido possível.',
      'autoFooter': 'Este email foi enviado automaticamente pelo LoveYou App.',
    },
    'it': {
      'verifySubject': '[LoveYou] Verifica email',
      'verifyBody': 'Ciao! Questa è un\'email di verifica da LoveYou App.\nRiceverla significa che l\'indirizzo è valido e può ricevere notifiche di emergenza.',
      'emailNotConfigured': 'Email non configurata',
      'testSubject': '[LoveYou] Test configurazione email',
      'testBody': 'Congratulazioni! La tua email LoveYou è configurata.\nIn caso di bisogno, le email verranno inviate da questo indirizzo.',
      'checkinSubject': '[LoveYou] {name} ha effettuato un check-in di sicurezza',
      'checkinGreeting': 'Ciao {name},',
      'checkinBody': '{name} ha completato un check-in di sicurezza alle {time}. Tutto bene.',
      'settingsSubject': '[LoveYou] {name} ha aggiornato le impostazioni di sicurezza',
      'settingsGreeting': 'Ciao {name},',
      'settingsChanged': '{name} ha aggiornato le impostazioni di sicurezza di LoveYou:',
      'locationUnavailable': 'Posizione non disponibile',
      'noRecord': 'Nessun registro',
      'sosSubject': '🆘 [LoveYou EMERGENZA] {name} è irraggiungibile da {days} giorni',
      'timeoutSubject': '[LoveYou] {name} non ha effettuato il check-in da {hours} ore',
      'sosHeader': 'AVVISO DI EMERGENZA!',
      'sosBody': '{name} non ha effettuato il check-in da {days} giorni e non mostra attività.',
      'timeoutGreeting': 'Ciao {name},',
      'timeoutBody': '{name} non ha effettuato un check-in di sicurezza da oltre {hours} ore.',
      'lastLocation': 'Ultima posizione nota: {location}',
      'lastCheckinTime': 'Ultimo check-in: {time}',
      'messageHeader': '--- Messaggio da {name} ---',
      'sosAction': 'Per favore contatta {name} immediatamente o recati alla sua ultima posizione!',
      'sosRepeat': "Questa email verrà inviata ogni ora fino a quando {name} non effettuerà il check-in.",
      'timeoutAction': 'Per favore verifica la sua sicurezza il prima possibile.',
      'autoFooter': 'Questa email è stata inviata automaticamente da LoveYou App.',
    },
  };
}
