// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Love You';

  @override
  String get checkinSuccess => 'Checked in ❤️';

  @override
  String get autoCheckinNotification => 'Auto checked in today ❤️';

  @override
  String streakDays(int count) {
    return '$count day streak';
  }

  @override
  String get welcomeTitle => 'LoveYou Watches Over You';

  @override
  String get welcomeSubtitle =>
      'One \"Love You\" a day keeps your loved ones at ease';

  @override
  String get setupName => 'Your Name';

  @override
  String get setupNameHint => 'Enter your name';

  @override
  String get setupContact => 'Emergency Contact';

  @override
  String get setupContactName => 'Contact Name';

  @override
  String get setupContactEmail => 'Contact Email';

  @override
  String get setupDone => 'Start Protection';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCheckinMode => 'Check-in Mode';

  @override
  String get settingsManualMode => 'Manual';

  @override
  String get settingsAutoMode => 'Automatic';

  @override
  String get settingsCheckinInterval => 'Check-in Interval';

  @override
  String get settingsInterval24h => 'Every 24 hours';

  @override
  String get settingsInterval12h => 'Every 12 hours';

  @override
  String get settingsInactivityThreshold => 'Inactivity Alert Time';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours hours';
  }

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsAccessibility => 'Care Mode (Accessibility)';

  @override
  String get settingsLastMessage => 'Last Message';

  @override
  String get settingsContacts => 'Emergency Contacts';

  @override
  String get settingsPurchase => 'Unlock All Features';

  @override
  String get contactsTitle => 'Emergency Contacts';

  @override
  String get contactsAdd => 'Add Contact';

  @override
  String contactsMax(int max) {
    return 'Up to $max contacts';
  }

  @override
  String contactsExtraCost(String price) {
    return 'Extra contact $price each';
  }

  @override
  String get contactsDefault => 'Default (1 included)';

  @override
  String get messageTitle => 'Last Message';

  @override
  String get messageHint => 'Write what you want to say to them...';

  @override
  String get messageSaved => 'Saved';

  @override
  String get purchaseTitle => 'Unlock LoveYou';

  @override
  String get purchaseDescription => 'One-time purchase, lifetime protection';

  @override
  String purchaseButton(String price) {
    return 'Unlock Now ($price)';
  }

  @override
  String get purchaseRestoreButton => 'Restore Purchase';

  @override
  String get alertPreWarning => 'Hey, are you okay? Tap here ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'No activity for $hours hours';
  }

  @override
  String get modeChangeNotice =>
      'Check-in mode changed. All emergency contacts notified.';

  @override
  String get thresholdChangeNotice =>
      'Alert time updated. All emergency contacts notified.';

  @override
  String get locationUnavailable => 'Location unavailable';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get done => 'Done';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get voiceCheckin => 'Voice Check-in';

  @override
  String get checkinReminderNotification =>
      'Don\'t forget to check in today ❤️';

  @override
  String get contactDeleteConfirm =>
      'Are you sure you want to delete this contact?';

  @override
  String get messageDescription =>
      'When an alert is triggered, this message will be sent to your emergency contacts via email.';

  @override
  String get emailSetupTitle => 'Email Setup';

  @override
  String get emailSetupHeading => 'Configure Sender Email';

  @override
  String get emailSetupDescription =>
      'When you miss a check-in, the app will use this email to notify your emergency contacts.';

  @override
  String get emailNotConfigured => 'Not configured (emails cannot be sent)';

  @override
  String get emailSaved => 'Email configuration saved';

  @override
  String get emailTestSuccess =>
      'Test email sent successfully! Check your inbox';

  @override
  String get emailProviderAuto => 'Auto Detect';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'Custom SMTP';

  @override
  String get emailProviderLabel => 'Email Provider';

  @override
  String get emailAddressLabel => 'Email Address';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => 'Please enter your email';

  @override
  String get emailAddressInvalid => 'Invalid email format';

  @override
  String get emailPasswordLabel => 'Password / Auth Code';

  @override
  String get emailPasswordHint => 'Gmail: app password, QQ/163: auth code';

  @override
  String get emailPasswordRequired => 'Please enter password or auth code';

  @override
  String get emailSmtpHost => 'SMTP Server';

  @override
  String get emailSmtpHostRequired => 'Please enter SMTP server';

  @override
  String get emailSmtpPort => 'Port';

  @override
  String get emailTipTitle => 'Tips';

  @override
  String get emailTipContent =>
      '• Gmail: Enable 2-Step Verification, then generate \"App Password\"\n• QQ Mail: Settings → Account → Generate \"Auth Code\"\n• 163 Mail: Settings → POP3/SMTP → Enable and get auth code\n• Passwords are stored locally on your device only';

  @override
  String get emailSaveButton => 'Save Configuration';

  @override
  String get emailTestButton => 'Send Test Email';

  @override
  String get emailTesting => 'Sending...';

  @override
  String get emailErrorAuthTitle => 'Authentication Failed';

  @override
  String get emailErrorNetworkTitle => 'Network Connection Failed';

  @override
  String get emailErrorGenericTitle => 'Send Failed';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Error: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Check your network connection (Wi-Fi or cellular)\n2. If using a VPN, try disabling it\n3. For custom SMTP, verify the server address and port\n4. Some networks block ports 465/587, try switching';

  @override
  String get emailErrorGenericSteps =>
      'Please check:\n1. Email address is correct\n2. Password/auth code is correct\n3. Network is working';

  @override
  String get emailErrorDismiss => 'OK';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail requires an \"Auth Code\" instead of your login password\n\nSteps:\n1. Log in at mail.qq.com on a computer\n2. Go to Settings → Account\n3. Find POP3/IMAP/SMTP service\n4. Enable IMAP/SMTP (SMS verification required)\n5. Click \"Generate Auth Code\"\n6. Enter the 16-digit code in the password field above';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail requires an \"Auth Code\" instead of your login password\n\nSteps:\n1. Log in at mail.163.com on a computer\n2. Go to Settings → POP3/SMTP/IMAP\n3. Enable IMAP/SMTP service\n4. Follow SMS verification prompt\n5. Enter the auth code in the password field above';

  @override
  String get emailGuideGmail =>
      '❌ Gmail requires an \"App Password\"\n\nSteps:\n1. Go to myaccount.google.com\n2. Navigate to Security → 2-Step Verification (must be enabled first)\n3. At the bottom find \"App Passwords\"\n4. Select Mail → Generate password\n5. Enter the 16-digit password in the field above\n\n⚠️ If you can\'t find App Passwords, make sure 2-Step Verification is enabled first';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail requires an \"App Password\"\n\nSteps:\n1. Go to account.microsoft.com\n2. Navigate to Security → Advanced security options\n3. Enable Two-step verification\n4. Create a new App password\n5. Enter the generated password above';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail requires an \"App-Specific Password\"\n\nSteps:\n1. Go to appleid.apple.com and sign in\n2. Navigate to Sign-In and Security → App-Specific Passwords\n3. Click \"Generate an App-Specific Password\"\n4. Enter the password above';

  @override
  String get emailGuideGeneric =>
      'Login failed. Possible reasons:\n\n1. Incorrect password — Many email providers don\'t allow login passwords for SMTP. You may need an \"Auth Code\" or \"App Password\"\n2. SMTP not enabled — Log in to your email\'s web interface and enable SMTP in settings\n3. Rate limited — Too many attempts in a short time. Please try again later\n\nCheck your email provider\'s SMTP settings page for details.';

  @override
  String get purchaseFeatureCheckin => 'Check-in Guard';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Manual + auto check-in, streak tracking';

  @override
  String get purchaseFeatureAlert => '3-Level Alert';

  @override
  String get purchaseFeatureAlertDesc =>
      'Warning → timeout email → SOS emergency email';

  @override
  String get purchaseFeatureLocation => 'Location Sharing';

  @override
  String get purchaseFeatureLocationDesc =>
      'GPS location, sent to contacts in emergencies';

  @override
  String get purchaseFeatureMessage => 'Last Message';

  @override
  String get purchaseFeatureMessageDesc =>
      'Write your words, sent with emergency emails';

  @override
  String get purchaseUnlocked => 'All features unlocked';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Current slots: $current (max $max)';
  }

  @override
  String get purchaseAddContact => 'Add 1 contact slot';

  @override
  String get noRecord => 'No record';

  @override
  String get emailUsingDefault => 'Using default email';

  @override
  String get contactVerifyEmail => 'Verify Email';

  @override
  String get contactVerifying => 'Verifying...';

  @override
  String get contactVerifySuccess =>
      'Verification email sent, ask your contact to check inbox';

  @override
  String get contactVerifyFail =>
      'Failed to send, please check the email address';

  @override
  String get paywallTitle => 'Feature Locked';

  @override
  String get paywallMessage =>
      'This feature requires purchase to take effect. Unlock now to activate full protection.';

  @override
  String get paywallUnlock => 'Unlock Now';

  @override
  String get paywallContactTitle => 'Contact Slots Full';

  @override
  String get paywallContactMessage =>
      'You\'ve used all free contact slots. Purchase extra slots to add more contacts.';
}
