// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Ich liebe dich';

  @override
  String get checkinSuccess => 'Eingecheckt ❤️';

  @override
  String get autoCheckinNotification => 'Heute automatisch eingecheckt ❤️';

  @override
  String streakDays(int count) {
    return '$count Tage in Folge';
  }

  @override
  String get welcomeTitle => 'LoveYou wacht über dich';

  @override
  String get welcomeSubtitle =>
      'Ein \'Ich liebe dich\' am Tag gibt deinen Liebsten Sicherheit';

  @override
  String get setupName => 'Dein Name';

  @override
  String get setupNameHint => 'Gib deinen Namen ein';

  @override
  String get setupContact => 'Notfallkontakt';

  @override
  String get setupContactName => 'Name des Kontakts';

  @override
  String get setupContactEmail => 'E-Mail des Kontakts';

  @override
  String get setupDone => 'Schutz starten';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsCheckinMode => 'Check-in-Modus';

  @override
  String get settingsManualMode => 'Manuell';

  @override
  String get settingsAutoMode => 'Automatisch';

  @override
  String get settingsCheckinInterval => 'Check-in-Intervall';

  @override
  String get settingsInterval24h => 'Alle 24 Stunden';

  @override
  String get settingsInterval12h => 'Alle 12 Stunden';

  @override
  String get settingsInactivityThreshold => 'Inaktivitätswarnung';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours Stunden';
  }

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsAccessibility => 'Barrierefreiheit';

  @override
  String get settingsLastMessage => 'Letzte Nachricht';

  @override
  String get settingsContacts => 'Notfallkontakte';

  @override
  String get settingsPurchase => 'Funktionen freischalten';

  @override
  String get contactsTitle => 'Notfallkontakte';

  @override
  String get contactsAdd => 'Kontakt hinzufügen';

  @override
  String contactsMax(int max) {
    return 'Bis zu $max Kontakte';
  }

  @override
  String get contactsExtraCost => 'Zusätzlicher Kontakt 0,99 € pro Stück';

  @override
  String get contactsDefault => 'Standard (1 inklusive)';

  @override
  String get messageTitle => 'Letzte Nachricht';

  @override
  String get messageHint => 'Schreibe, was du ihnen sagen möchtest...';

  @override
  String get messageSaved => 'Gespeichert';

  @override
  String get purchaseTitle => 'LoveYou freischalten';

  @override
  String get purchaseDescription => 'Einmaliger Kauf, lebenslanger Schutz';

  @override
  String get purchasePrice => '0,99 €';

  @override
  String get purchaseButton => 'Jetzt freischalten';

  @override
  String get purchaseRestoreButton => 'Kauf wiederherstellen';

  @override
  String get alertPreWarning => 'Hey, alles okay? Tippe hier ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'Keine Aktivität seit $hours Stunden';
  }

  @override
  String get modeChangeNotice =>
      'Modus geändert. Notfallkontakte benachrichtigt.';

  @override
  String get thresholdChangeNotice =>
      'Alarmzeit aktualisiert. Kontakte benachrichtigt.';

  @override
  String get locationUnavailable => 'Standort nicht verfügbar';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get done => 'Fertig';

  @override
  String get voiceListening => 'Zuhören...';

  @override
  String get voiceCheckin => 'Sprach-Check-in';

  @override
  String get checkinReminderNotification =>
      'Vergiss nicht, dich heute einzuchecken ❤️';

  @override
  String get contactDeleteConfirm =>
      'Möchten Sie diesen Kontakt wirklich löschen?';

  @override
  String get messageDescription =>
      'Wenn ein Alarm ausgelöst wird, wird diese Nachricht per E-Mail an Ihre Notfallkontakte gesendet.';

  @override
  String get emailSetupTitle => 'E-Mail-Einrichtung';

  @override
  String get emailSetupHeading => 'Absender-E-Mail konfigurieren';

  @override
  String get emailSetupDescription =>
      'Wenn Sie sich nicht rechtzeitig einchecken, verwendet die App diese E-Mail, um Ihre Notfallkontakte zu benachrichtigen.';

  @override
  String get emailNotConfigured =>
      'Nicht konfiguriert (E-Mails können nicht gesendet werden)';

  @override
  String get emailSaved => 'E-Mail-Konfiguration gespeichert';

  @override
  String get emailTestSuccess =>
      'Test-E-Mail gesendet! Überprüfen Sie Ihren Posteingang';

  @override
  String get emailProviderAuto => 'Automatische Erkennung';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'Benutzerdefiniertes SMTP';

  @override
  String get emailProviderLabel => 'E-Mail-Anbieter';

  @override
  String get emailAddressLabel => 'E-Mail-Adresse';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => 'Bitte E-Mail eingeben';

  @override
  String get emailAddressInvalid => 'Ungültiges E-Mail-Format';

  @override
  String get emailPasswordLabel => 'Passwort / Autorisierungscode';

  @override
  String get emailPasswordHint =>
      'Gmail: App-Passwort, QQ/163: Autorisierungscode';

  @override
  String get emailPasswordRequired => 'Bitte Passwort oder Code eingeben';

  @override
  String get emailSmtpHost => 'SMTP-Server';

  @override
  String get emailSmtpHostRequired => 'Bitte SMTP-Server eingeben';

  @override
  String get emailSmtpPort => 'Port';

  @override
  String get emailTipTitle => 'Tipps';

  @override
  String get emailTipContent =>
      '• Gmail: Aktivieren Sie die 2-Schritt-Verifizierung und erstellen Sie ein «App-Passwort»\n• QQ Mail: Einstellungen → Konto → «Autorisierungscode» generieren\n• 163 Mail: Einstellungen → POP3/SMTP → Aktivieren und Code erhalten\n• Passwörter werden nur auf Ihrem Gerät gespeichert';

  @override
  String get emailSaveButton => 'Konfiguration speichern';

  @override
  String get emailTestButton => 'Test-E-Mail senden';

  @override
  String get emailTesting => 'Wird gesendet...';

  @override
  String get emailErrorAuthTitle => 'Authentifizierung fehlgeschlagen';

  @override
  String get emailErrorNetworkTitle => 'Netzwerkverbindung fehlgeschlagen';

  @override
  String get emailErrorGenericTitle => 'Senden fehlgeschlagen';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Fehler: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Überprüfen Sie Ihre Netzwerkverbindung (WLAN oder mobile Daten)\n2. Falls Sie ein VPN verwenden, versuchen Sie es zu deaktivieren\n3. Bei benutzerdefiniertem SMTP überprüfen Sie Serveradresse und Port\n4. Einige Netzwerke blockieren die Ports 465/587, versuchen Sie zu wechseln';

  @override
  String get emailErrorGenericSteps =>
      'Überprüfen Sie:\n1. Ist die E-Mail-Adresse korrekt\n2. Ist das Passwort/der Code korrekt\n3. Funktioniert das Netzwerk einwandfrei';

  @override
  String get emailErrorDismiss => 'Verstanden';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail erfordert einen «Autorisierungscode» anstelle Ihres Passworts\n\nSchritte:\n1. Melden Sie sich bei mail.qq.com an\n2. Gehen Sie zu Einstellungen → Konto\n3. Suchen Sie den POP3/IMAP/SMTP-Dienst\n4. Aktivieren Sie IMAP/SMTP (SMS-Verifizierung erforderlich)\n5. Klicken Sie auf «Autorisierungscode generieren»\n6. Geben Sie den 16-stelligen Code oben ein';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail erfordert einen «Autorisierungscode»\n\nSchritte:\n1. Melden Sie sich bei mail.163.com an\n2. Gehen Sie zu Einstellungen → POP3/SMTP/IMAP\n3. Aktivieren Sie den IMAP/SMTP-Dienst\n4. Folgen Sie der SMS-Verifizierung\n5. Geben Sie den Autorisierungscode oben ein';

  @override
  String get emailGuideGmail =>
      '❌ Gmail erfordert ein «App-Passwort»\n\nSchritte:\n1. Gehen Sie zu myaccount.google.com\n2. Sicherheit → 2-Schritt-Verifizierung (muss aktiviert sein)\n3. Suchen Sie «App-Passwörter» unten auf der Seite\n4. Wählen Sie E-Mail → Passwort generieren\n5. Geben Sie das 16-stellige Passwort oben ein\n\n⚠️ Falls Sie «App-Passwörter» nicht finden, aktivieren Sie zuerst die 2-Schritt-Verifizierung';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail erfordert ein «App-Passwort»\n\nSchritte:\n1. Gehen Sie zu account.microsoft.com\n2. Sicherheit → Erweiterte Sicherheitsoptionen\n3. Aktivieren Sie die Zwei-Schritt-Verifizierung\n4. Erstellen Sie ein neues App-Passwort\n5. Geben Sie das generierte Passwort oben ein';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail erfordert ein «App-spezifisches Passwort»\n\nSchritte:\n1. Gehen Sie zu appleid.apple.com und melden Sie sich an\n2. Anmeldung und Sicherheit → App-spezifische Passwörter\n3. Klicken Sie auf «Passwort generieren»\n4. Geben Sie das Passwort oben ein';

  @override
  String get emailGuideGeneric =>
      'Anmeldung fehlgeschlagen. Mögliche Ursachen:\n\n1. Falsches Passwort — Viele Anbieter erlauben kein Login-Passwort für SMTP. Sie benötigen einen «Autorisierungscode» oder ein «App-Passwort»\n2. SMTP nicht aktiviert — Melden Sie sich bei der Webversion Ihrer E-Mail an und aktivieren Sie SMTP in den Einstellungen\n3. Versuchslimit — Zu viele Versuche. Versuchen Sie es später erneut\n\nÜberprüfen Sie die SMTP-Einstellungen Ihres Anbieters.';

  @override
  String get purchaseFeatureCheckin => 'Check-in-Schutz';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Manuelles + automatisches Check-in, Tagessträhne';

  @override
  String get purchaseFeatureAlert => '3-Stufen-Alarm';

  @override
  String get purchaseFeatureAlertDesc =>
      'Warnung → Timeout-E-Mail → SOS-Notfall-E-Mail';

  @override
  String get purchaseFeatureLocation => 'Standort teilen';

  @override
  String get purchaseFeatureLocationDesc =>
      'GPS, wird bei Notfällen an Kontakte gesendet';

  @override
  String get purchaseFeatureMessage => 'Letzte Nachricht';

  @override
  String get purchaseFeatureMessageDesc =>
      'Schreiben Sie Ihre Worte, gesendet mit Notfall-E-Mails';

  @override
  String get purchaseUnlocked => 'Alle Funktionen freigeschaltet';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Aktuelle Plätze: $current (max $max)';
  }

  @override
  String get purchaseAddContact => '1 Kontaktplatz hinzufügen';

  @override
  String get noRecord => 'Kein Eintrag';

  @override
  String get emailUsingDefault => 'Standard-E-Mail wird verwendet';

  @override
  String get contactVerifyEmail => 'E-Mail verifizieren';

  @override
  String get contactVerifying => 'Wird verifiziert...';

  @override
  String get contactVerifySuccess =>
      'Verifizierungs-E-Mail gesendet, bitte Kontakt bitten, Posteingang zu prüfen';

  @override
  String get contactVerifyFail =>
      'Senden fehlgeschlagen, bitte E-Mail-Adresse überprüfen';
}
