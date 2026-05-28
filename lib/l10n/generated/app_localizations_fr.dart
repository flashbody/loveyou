// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Je t\'aime';

  @override
  String get checkinSuccess => 'Enregistré ❤️';

  @override
  String get autoCheckinNotification => 'Enregistrement auto aujourd\'hui ❤️';

  @override
  String streakDays(int count) {
    return '$count jours consécutifs';
  }

  @override
  String get welcomeTitle => 'LoveYou veille sur toi';

  @override
  String get welcomeSubtitle =>
      'Un « Je t\'aime » par jour rassure ceux qui t\'aiment';

  @override
  String get setupName => 'Ton nom';

  @override
  String get setupNameHint => 'Entre ton nom';

  @override
  String get setupContact => 'Contact d\'urgence';

  @override
  String get setupContactName => 'Nom du contact';

  @override
  String get setupContactEmail => 'Email du contact';

  @override
  String get setupDone => 'Démarrer la protection';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsCheckinMode => 'Mode d\'enregistrement';

  @override
  String get settingsManualMode => 'Manuel';

  @override
  String get settingsAutoMode => 'Automatique';

  @override
  String get settingsCheckinInterval => 'Intervalle';

  @override
  String get settingsInterval24h => 'Toutes les 24 heures';

  @override
  String get settingsInterval12h => 'Toutes les 12 heures';

  @override
  String get settingsInactivityThreshold => 'Alerte d\'inactivité';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours heures';
  }

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsAccessibility => 'Mode accessibilité';

  @override
  String get settingsLastMessage => 'Dernier message';

  @override
  String get settingsContacts => 'Contacts d\'urgence';

  @override
  String get settingsPurchase => 'Débloquer les fonctions';

  @override
  String get contactsTitle => 'Contacts d\'urgence';

  @override
  String get contactsAdd => 'Ajouter un contact';

  @override
  String contactsMax(int max) {
    return 'Jusqu\'à $max contacts';
  }

  @override
  String contactsExtraCost(String price) {
    return 'Contact supplémentaire $price chacun';
  }

  @override
  String get contactsDefault => 'Par défaut (1 inclus)';

  @override
  String get messageTitle => 'Dernier message';

  @override
  String get messageHint => 'Écris ce que tu veux leur dire...';

  @override
  String get messageSaved => 'Enregistré';

  @override
  String get purchaseTitle => 'Débloquer LoveYou';

  @override
  String get purchaseDescription => 'Achat unique, protection à vie';

  @override
  String purchaseButton(String price) {
    return 'Débloquer ($price)';
  }

  @override
  String get purchaseRestoreButton => 'Restaurer l\'achat';

  @override
  String get alertPreWarning => 'Hé, tu vas bien ? Appuie ici ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'Aucune activité depuis $hours heures';
  }

  @override
  String get modeChangeNotice => 'Mode modifié. Contacts d\'urgence notifiés.';

  @override
  String get thresholdChangeNotice =>
      'Temps d\'alerte mis à jour. Contacts notifiés.';

  @override
  String get locationUnavailable => 'Position indisponible';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get done => 'Terminé';

  @override
  String get voiceListening => 'Écoute en cours...';

  @override
  String get voiceCheckin => 'Enregistrement vocal';

  @override
  String get checkinReminderNotification =>
      'N\'oublie pas de t\'enregistrer aujourd\'hui ❤️';

  @override
  String get contactDeleteConfirm =>
      'Voulez-vous vraiment supprimer ce contact ?';

  @override
  String get messageDescription =>
      'Lorsqu\'une alerte est déclenchée, ce message sera envoyé à vos contacts d\'urgence par email.';

  @override
  String get emailSetupTitle => 'Configuration email';

  @override
  String get emailSetupHeading => 'Configurer l\'email d\'envoi';

  @override
  String get emailSetupDescription =>
      'Quand vous ne vous enregistrez pas à temps, l\'app utilisera cet email pour prévenir vos contacts d\'urgence.';

  @override
  String get emailNotConfigured =>
      'Non configuré (les emails ne peuvent pas être envoyés)';

  @override
  String get emailSaved => 'Configuration email enregistrée';

  @override
  String get emailTestSuccess =>
      'Email de test envoyé ! Vérifiez votre boîte de réception';

  @override
  String get emailProviderAuto => 'Détection automatique';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'SMTP personnalisé';

  @override
  String get emailProviderLabel => 'Fournisseur email';

  @override
  String get emailAddressLabel => 'Adresse email';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => 'Veuillez entrer votre email';

  @override
  String get emailAddressInvalid => 'Format d\'email invalide';

  @override
  String get emailPasswordLabel => 'Mot de passe / Code d\'autorisation';

  @override
  String get emailPasswordHint =>
      'Gmail : mot de passe d\'app, QQ/163 : code d\'auth';

  @override
  String get emailPasswordRequired =>
      'Veuillez entrer le mot de passe ou le code';

  @override
  String get emailSmtpHost => 'Serveur SMTP';

  @override
  String get emailSmtpHostRequired => 'Veuillez entrer le serveur SMTP';

  @override
  String get emailSmtpPort => 'Port';

  @override
  String get emailTipTitle => 'Conseils';

  @override
  String get emailTipContent =>
      '• Gmail : Activez la validation en 2 étapes puis générez un « Mot de passe d\'application »\n• QQ Mail : Paramètres → Compte → Générez un « Code d\'autorisation »\n• 163 Mail : Paramètres → POP3/SMTP → Activez et obtenez le code\n• Les mots de passe sont stockés uniquement sur votre appareil';

  @override
  String get emailSaveButton => 'Enregistrer la configuration';

  @override
  String get emailTestButton => 'Envoyer un email de test';

  @override
  String get emailTesting => 'Envoi en cours...';

  @override
  String get emailErrorAuthTitle => 'Échec d\'authentification';

  @override
  String get emailErrorNetworkTitle => 'Échec de connexion réseau';

  @override
  String get emailErrorGenericTitle => 'Échec d\'envoi';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Erreur : $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Vérifiez votre connexion réseau (Wi-Fi ou données mobiles)\n2. Si vous utilisez un VPN, essayez de le désactiver\n3. Pour un SMTP personnalisé, vérifiez l\'adresse et le port du serveur\n4. Certains réseaux bloquent les ports 465/587, essayez d\'en changer';

  @override
  String get emailErrorGenericSteps =>
      'Vérifiez :\n1. L\'adresse email est correcte\n2. Le mot de passe/code est correct\n3. Le réseau fonctionne correctement';

  @override
  String get emailErrorDismiss => 'Compris';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail nécessite un « Code d\'autorisation » au lieu de votre mot de passe\n\nÉtapes :\n1. Connectez-vous sur mail.qq.com\n2. Allez dans Paramètres → Compte\n3. Trouvez le service POP3/IMAP/SMTP\n4. Activez IMAP/SMTP (vérification SMS requise)\n5. Cliquez sur « Générer un code d\'autorisation »\n6. Entrez le code à 16 chiffres ci-dessus';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail nécessite un « Code d\'autorisation »\n\nÉtapes :\n1. Connectez-vous sur mail.163.com\n2. Allez dans Paramètres → POP3/SMTP/IMAP\n3. Activez le service IMAP/SMTP\n4. Suivez la vérification par SMS\n5. Entrez le code d\'autorisation ci-dessus';

  @override
  String get emailGuideGmail =>
      '❌ Gmail nécessite un « Mot de passe d\'application »\n\nÉtapes :\n1. Allez sur myaccount.google.com\n2. Sécurité → Validation en 2 étapes (doit être activée)\n3. Trouvez « Mots de passe des applications » en bas\n4. Sélectionnez Messagerie → Générer un mot de passe\n5. Entrez le mot de passe à 16 chiffres ci-dessus\n\n⚠️ Si vous ne trouvez pas « Mots de passe des applications », activez d\'abord la validation en 2 étapes';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail nécessite un « Mot de passe d\'application »\n\nÉtapes :\n1. Allez sur account.microsoft.com\n2. Sécurité → Options de sécurité avancées\n3. Activez la vérification en deux étapes\n4. Créez un nouveau mot de passe d\'application\n5. Entrez le mot de passe généré ci-dessus';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail nécessite un « Mot de passe spécifique à l\'app »\n\nÉtapes :\n1. Allez sur appleid.apple.com et connectez-vous\n2. Connexion et sécurité → Mots de passe spécifiques aux apps\n3. Cliquez sur « Générer un mot de passe »\n4. Entrez le mot de passe ci-dessus';

  @override
  String get emailGuideGeneric =>
      'Échec de connexion. Causes possibles :\n\n1. Mot de passe incorrect — De nombreux fournisseurs n\'autorisent pas le mot de passe de connexion pour SMTP. Vous avez besoin d\'un « Code d\'autorisation » ou d\'un « Mot de passe d\'application »\n2. SMTP non activé — Connectez-vous à la version web de votre email et activez SMTP dans les paramètres\n3. Limite de tentatives — Trop de tentatives. Réessayez plus tard\n\nConsultez les paramètres SMTP de votre fournisseur.';

  @override
  String get purchaseFeatureCheckin => 'Garde d\'enregistrement';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Enregistrement manuel + auto, suivi des jours consécutifs';

  @override
  String get purchaseFeatureAlert => 'Alerte à 3 niveaux';

  @override
  String get purchaseFeatureAlertDesc =>
      'Avertissement → email de délai → email SOS d\'urgence';

  @override
  String get purchaseFeatureLocation => 'Partage de position';

  @override
  String get purchaseFeatureLocationDesc =>
      'GPS, envoyée aux contacts en cas d\'urgence';

  @override
  String get purchaseFeatureMessage => 'Dernier message';

  @override
  String get purchaseFeatureMessageDesc =>
      'Écrivez vos mots, envoyés avec les emails d\'urgence';

  @override
  String get purchaseUnlocked => 'Toutes les fonctions débloquées';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Places actuelles : $current (max $max)';
  }

  @override
  String get purchaseAddContact => 'Ajouter 1 place de contact';

  @override
  String get noRecord => 'Aucun enregistrement';

  @override
  String get emailUsingDefault => 'Utilisation de l\'email par défaut';

  @override
  String get contactVerifyEmail => 'Vérifier l\'email';

  @override
  String get contactVerifying => 'Vérification...';

  @override
  String get contactVerifySuccess =>
      'Email de vérification envoyé, demandez au contact de vérifier sa boîte';

  @override
  String get contactVerifyFail =>
      'Échec de l\'envoi, vérifiez l\'adresse email';

  @override
  String get paywallTitle => 'Fonctionnalité verrouillée';

  @override
  String get paywallMessage =>
      'Cette fonctionnalité nécessite un achat pour être activée. Déverrouillez maintenant pour activer la protection complète.';

  @override
  String get paywallUnlock => 'Déverrouiller';

  @override
  String get paywallContactTitle => 'Places de contact pleines';

  @override
  String get paywallContactMessage =>
      'Vos places gratuites sont épuisées. Achetez des places supplémentaires pour ajouter plus de contacts.';
}
