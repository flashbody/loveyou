// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Ti Amo';

  @override
  String get checkinSuccess => 'Check-in effettuato ❤️';

  @override
  String get autoCheckinNotification => 'Check-in automatico oggi ❤️';

  @override
  String streakDays(int count) {
    return '$count giorni consecutivi';
  }

  @override
  String get welcomeTitle => 'LoveYou ti protegge';

  @override
  String get welcomeSubtitle => 'Un \"Ti Amo\" al giorno rassicura chi ti ama';

  @override
  String get setupName => 'Il tuo nome';

  @override
  String get setupNameHint => 'Inserisci il tuo nome';

  @override
  String get setupContact => 'Contatto di emergenza';

  @override
  String get setupContactName => 'Nome del contatto';

  @override
  String get setupContactEmail => 'Email del contatto';

  @override
  String get setupDone => 'Avvia la protezione';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsCheckinMode => 'Modalità check-in';

  @override
  String get settingsManualMode => 'Manuale';

  @override
  String get settingsAutoMode => 'Automatico';

  @override
  String get settingsCheckinInterval => 'Intervallo check-in';

  @override
  String get settingsInterval24h => 'Ogni 24 ore';

  @override
  String get settingsInterval12h => 'Ogni 12 ore';

  @override
  String get settingsInactivityThreshold => 'Avviso inattività';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours ore';
  }

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsAccessibility => 'Modalità accessibilità';

  @override
  String get settingsLastMessage => 'Ultimo messaggio';

  @override
  String get settingsContacts => 'Contatti di emergenza';

  @override
  String get settingsPurchase => 'Sblocca funzioni';

  @override
  String get contactsTitle => 'Contatti di emergenza';

  @override
  String get contactsAdd => 'Aggiungi contatto';

  @override
  String contactsMax(int max) {
    return 'Fino a $max contatti';
  }

  @override
  String get contactsExtraCost => 'Contatto extra €0,99 ciascuno';

  @override
  String get contactsDefault => 'Predefinito (1 incluso)';

  @override
  String get messageTitle => 'Ultimo messaggio';

  @override
  String get messageHint => 'Scrivi quello che vuoi dire loro...';

  @override
  String get messageSaved => 'Salvato';

  @override
  String get purchaseTitle => 'Sblocca LoveYou';

  @override
  String get purchaseDescription => 'Acquisto unico, protezione a vita';

  @override
  String get purchasePrice => '€0,99';

  @override
  String get purchaseButton => 'Sblocca ora';

  @override
  String get purchaseRestoreButton => 'Ripristina acquisto';

  @override
  String get alertPreWarning => 'Ehi, tutto bene? Tocca qui ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'Nessuna attività da $hours ore';
  }

  @override
  String get modeChangeNotice =>
      'Modalità cambiata. Contatti di emergenza avvisati.';

  @override
  String get thresholdChangeNotice =>
      'Tempo di avviso aggiornato. Contatti avvisati.';

  @override
  String get locationUnavailable => 'Posizione non disponibile';

  @override
  String get cancel => 'Annulla';

  @override
  String get confirm => 'Conferma';

  @override
  String get save => 'Salva';

  @override
  String get delete => 'Elimina';

  @override
  String get edit => 'Modifica';

  @override
  String get done => 'Fatto';

  @override
  String get voiceListening => 'In ascolto...';

  @override
  String get voiceCheckin => 'Check-in vocale';

  @override
  String get checkinReminderNotification =>
      'Non dimenticare di fare il check-in oggi ❤️';

  @override
  String get contactDeleteConfirm =>
      'Sei sicuro di voler eliminare questo contatto?';

  @override
  String get messageDescription =>
      'Quando viene attivato un avviso, questo messaggio verrà inviato ai tuoi contatti di emergenza via e-mail.';

  @override
  String get emailSetupTitle => 'Configurazione e-mail';

  @override
  String get emailSetupHeading => 'Configura e-mail di invio';

  @override
  String get emailSetupDescription =>
      'Quando salti un check-in, l\'app utilizzerà questa e-mail per avvisare i tuoi contatti di emergenza.';

  @override
  String get emailNotConfigured =>
      'Non configurato (impossibile inviare e-mail)';

  @override
  String get emailSaved => 'Configurazione e-mail salvata';

  @override
  String get emailTestSuccess =>
      'E-mail di test inviata con successo! Controlla la posta in arrivo';

  @override
  String get emailProviderAuto => 'Rilevamento automatico';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'SMTP personalizzato';

  @override
  String get emailProviderLabel => 'Provider e-mail';

  @override
  String get emailAddressLabel => 'Indirizzo e-mail';

  @override
  String get emailAddressHint => 'tu@esempio.com';

  @override
  String get emailAddressRequired => 'Inserisci il tuo indirizzo e-mail';

  @override
  String get emailAddressInvalid => 'Formato e-mail non valido';

  @override
  String get emailPasswordLabel => 'Password / Codice di autenticazione';

  @override
  String get emailPasswordHint =>
      'Gmail: password app, QQ/163: codice di autenticazione';

  @override
  String get emailPasswordRequired =>
      'Inserisci la password o il codice di autenticazione';

  @override
  String get emailSmtpHost => 'Server SMTP';

  @override
  String get emailSmtpHostRequired => 'Inserisci il server SMTP';

  @override
  String get emailSmtpPort => 'Porta';

  @override
  String get emailTipTitle => 'Suggerimenti';

  @override
  String get emailTipContent =>
      '• Gmail: Attiva la Verifica in due passaggi, poi genera una Password per le app\n• QQ Mail: Impostazioni → Account → Genera codice di autenticazione\n• 163 Mail: Impostazioni → POP3/SMTP → Attiva e ottieni il codice\n• Le password sono memorizzate solo localmente sul tuo dispositivo';

  @override
  String get emailSaveButton => 'Salva configurazione';

  @override
  String get emailTestButton => 'Invia e-mail di test';

  @override
  String get emailTesting => 'Invio in corso...';

  @override
  String get emailErrorAuthTitle => 'Autenticazione fallita';

  @override
  String get emailErrorNetworkTitle => 'Connessione di rete fallita';

  @override
  String get emailErrorGenericTitle => 'Invio fallito';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Errore: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Controlla la connessione di rete (Wi-Fi o dati mobili)\n2. Se usi una VPN, prova a disattivarla\n3. Per SMTP personalizzato, verifica l\'indirizzo del server e la porta\n4. Alcune reti bloccano le porte 465/587, prova a cambiare';

  @override
  String get emailErrorGenericSteps =>
      'Verifica:\n1. L\'indirizzo e-mail è corretto\n2. La password/codice di autenticazione è corretto\n3. La rete funziona';

  @override
  String get emailErrorDismiss => 'OK';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail richiede un Codice di Autenticazione anziché la password di accesso\n\nPassaggi:\n1. Accedi a mail.qq.com\n2. Vai su Impostazioni → Account\n3. Trova il servizio POP3/IMAP/SMTP\n4. Attiva IMAP/SMTP (verifica SMS necessaria)\n5. Clicca su Genera Codice di Autenticazione\n6. Inserisci il codice di 16 cifre nel campo password sopra';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail richiede un Codice di Autenticazione\n\nPassaggi:\n1. Accedi a mail.163.com\n2. Vai su Impostazioni → POP3/SMTP/IMAP\n3. Attiva il servizio IMAP/SMTP\n4. Segui la verifica SMS\n5. Inserisci il codice di autenticazione nel campo password sopra';

  @override
  String get emailGuideGmail =>
      '❌ Gmail richiede una Password per le app\n\nPassaggi:\n1. Vai su myaccount.google.com\n2. Sicurezza → Verifica in due passaggi (deve essere attivata)\n3. Trova Password per le app in fondo\n4. Seleziona Posta → Genera password\n5. Inserisci la password di 16 cifre sopra\n\n⚠️ Se non trovi Password per le app, attiva prima la Verifica in due passaggi';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail richiede una Password per le app\n\nPassaggi:\n1. Vai su account.microsoft.com\n2. Sicurezza → Opzioni di sicurezza avanzate\n3. Attiva la Verifica in due passaggi\n4. Crea una nuova Password per le app\n5. Inserisci la password generata sopra';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail richiede una Password specifica per le app\n\nPassaggi:\n1. Vai su appleid.apple.com e accedi\n2. Accesso e sicurezza → Password specifiche per le app\n3. Clicca su Genera una password specifica per le app\n4. Inserisci la password sopra';

  @override
  String get emailGuideGeneric =>
      'Accesso fallito. Possibili cause:\n\n1. Password errata — Molti provider non consentono la password di accesso per SMTP. Potrebbe servirti un Codice di Autenticazione o una Password per le app\n2. SMTP non attivato — Accedi all\'interfaccia web della tua e-mail e attiva SMTP\n3. Limite di tentativi — Troppi tentativi. Riprova più tardi\n\nControlla le impostazioni SMTP del tuo provider e-mail.';

  @override
  String get purchaseFeatureCheckin => 'Guardia check-in';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Check-in manuale + automatico, tracciamento sequenza';

  @override
  String get purchaseFeatureAlert => 'Avviso a 3 livelli';

  @override
  String get purchaseFeatureAlertDesc =>
      'Avviso → e-mail di scadenza → e-mail di emergenza SOS';

  @override
  String get purchaseFeatureLocation => 'Condivisione posizione';

  @override
  String get purchaseFeatureLocationDesc =>
      'Posizione GPS, inviata ai contatti in caso di emergenza';

  @override
  String get purchaseFeatureMessage => 'Ultimo messaggio';

  @override
  String get purchaseFeatureMessageDesc =>
      'Scrivi le tue parole, inviate con le e-mail di emergenza';

  @override
  String get purchaseUnlocked => 'Tutte le funzioni sbloccate';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Posti attuali: $current (massimo $max)';
  }

  @override
  String get purchaseAddContact => 'Aggiungi 1 posto contatto';

  @override
  String get noRecord => 'Nessun record';

  @override
  String get emailUsingDefault => 'Usando email predefinita';

  @override
  String get contactVerifyEmail => 'Verifica email';

  @override
  String get contactVerifying => 'Verifica in corso...';

  @override
  String get contactVerifySuccess =>
      'Email di verifica inviata, chiedi al contatto di controllare la posta';

  @override
  String get contactVerifyFail => 'Invio fallito, verifica l\'indirizzo email';
}
