// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Te Quiero';

  @override
  String get checkinSuccess => 'Registro exitoso ❤️';

  @override
  String get autoCheckinNotification => 'Registro automático hoy ❤️';

  @override
  String streakDays(int count) {
    return '$count días seguidos';
  }

  @override
  String get welcomeTitle => 'LoveYou te cuida';

  @override
  String get welcomeSubtitle =>
      'Un \"Te Quiero\" al día mantiene tranquilos a quienes te aman';

  @override
  String get setupName => 'Tu nombre';

  @override
  String get setupNameHint => 'Ingresa tu nombre';

  @override
  String get setupContact => 'Contacto de emergencia';

  @override
  String get setupContactName => 'Nombre del contacto';

  @override
  String get setupContactEmail => 'Email del contacto';

  @override
  String get setupDone => 'Iniciar protección';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsCheckinMode => 'Modo de registro';

  @override
  String get settingsManualMode => 'Manual';

  @override
  String get settingsAutoMode => 'Automático';

  @override
  String get settingsCheckinInterval => 'Intervalo de registro';

  @override
  String get settingsInterval24h => 'Cada 24 horas';

  @override
  String get settingsInterval12h => 'Cada 12 horas';

  @override
  String get settingsInactivityThreshold => 'Alerta de inactividad';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours horas';
  }

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsAccessibility => 'Modo accesible';

  @override
  String get settingsLastMessage => 'Último mensaje';

  @override
  String get settingsContacts => 'Contactos de emergencia';

  @override
  String get settingsPurchase => 'Desbloquear funciones';

  @override
  String get contactsTitle => 'Contactos de emergencia';

  @override
  String get contactsAdd => 'Agregar contacto';

  @override
  String contactsMax(int max) {
    return 'Hasta $max contactos';
  }

  @override
  String get contactsExtraCost => 'Contacto extra €0.99 c/u';

  @override
  String get contactsDefault => 'Predeterminado (1 incluido)';

  @override
  String get messageTitle => 'Último mensaje';

  @override
  String get messageHint => 'Escribe lo que quieras decirles...';

  @override
  String get messageSaved => 'Guardado';

  @override
  String get purchaseTitle => 'Desbloquear LoveYou';

  @override
  String get purchaseDescription => 'Compra única, protección de por vida';

  @override
  String get purchasePrice => '€0.99';

  @override
  String get purchaseButton => 'Desbloquear ahora';

  @override
  String get purchaseRestoreButton => 'Restaurar compra';

  @override
  String get alertPreWarning => 'Oye, ¿estás bien? Toca aquí ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'Sin actividad por $hours horas';
  }

  @override
  String get modeChangeNotice =>
      'Modo de registro cambiado. Contactos de emergencia notificados.';

  @override
  String get thresholdChangeNotice =>
      'Tiempo de alerta actualizado. Contactos de emergencia notificados.';

  @override
  String get locationUnavailable => 'Ubicación no disponible';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get done => 'Hecho';

  @override
  String get voiceListening => 'Escuchando...';

  @override
  String get voiceCheckin => 'Registro por voz';

  @override
  String get checkinReminderNotification => 'No olvides registrarte hoy ❤️';

  @override
  String get contactDeleteConfirm =>
      '¿Seguro que quieres eliminar este contacto?';

  @override
  String get messageDescription =>
      'Cuando se active una alerta, este mensaje se enviará a tus contactos de emergencia por email.';

  @override
  String get emailSetupTitle => 'Configuración de email';

  @override
  String get emailSetupHeading => 'Configurar email de envío';

  @override
  String get emailSetupDescription =>
      'Cuando no te registres a tiempo, la app usará este email para notificar a tus contactos de emergencia.';

  @override
  String get emailNotConfigured =>
      'No configurado (no se pueden enviar emails)';

  @override
  String get emailSaved => 'Configuración de email guardada';

  @override
  String get emailTestSuccess =>
      '¡Email de prueba enviado! Revisa tu bandeja de entrada';

  @override
  String get emailProviderAuto => 'Detección automática';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'SMTP personalizado';

  @override
  String get emailProviderLabel => 'Proveedor de email';

  @override
  String get emailAddressLabel => 'Dirección de email';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => 'Ingresa tu email';

  @override
  String get emailAddressInvalid => 'Formato de email inválido';

  @override
  String get emailPasswordLabel => 'Contraseña / Código de autorización';

  @override
  String get emailPasswordHint =>
      'Gmail: contraseña de app, QQ/163: código de auth';

  @override
  String get emailPasswordRequired => 'Ingresa contraseña o código';

  @override
  String get emailSmtpHost => 'Servidor SMTP';

  @override
  String get emailSmtpHostRequired => 'Ingresa servidor SMTP';

  @override
  String get emailSmtpPort => 'Puerto';

  @override
  String get emailTipTitle => 'Consejos';

  @override
  String get emailTipContent =>
      '• Gmail: Activa la verificación en 2 pasos y genera una \"Contraseña de aplicación\"\n• QQ Mail: Ajustes → Cuenta → Genera un \"Código de autorización\"\n• 163 Mail: Ajustes → POP3/SMTP → Activa y obtén el código\n• Las contraseñas se almacenan solo en tu dispositivo';

  @override
  String get emailSaveButton => 'Guardar configuración';

  @override
  String get emailTestButton => 'Enviar email de prueba';

  @override
  String get emailTesting => 'Enviando...';

  @override
  String get emailErrorAuthTitle => 'Error de autenticación';

  @override
  String get emailErrorNetworkTitle => 'Error de conexión';

  @override
  String get emailErrorGenericTitle => 'Error de envío';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Error: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Verifica tu conexión de red (Wi-Fi o datos móviles)\n2. Si usas VPN, intenta desactivarla\n3. Para SMTP personalizado, verifica la dirección y puerto\n4. Algunas redes bloquean los puertos 465/587';

  @override
  String get emailErrorGenericSteps =>
      'Verifica:\n1. La dirección de email es correcta\n2. La contraseña/código es correcto\n3. La red funciona correctamente';

  @override
  String get emailErrorDismiss => 'Entendido';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail requiere un \"Código de autorización\" en vez de tu contraseña\n\nPasos:\n1. Inicia sesión en mail.qq.com\n2. Ve a Ajustes → Cuenta\n3. Busca el servicio POP3/IMAP/SMTP\n4. Activa IMAP/SMTP (requiere verificación SMS)\n5. Haz clic en \"Generar código de autorización\"\n6. Ingresa el código de 16 dígitos arriba';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail requiere un \"Código de autorización\"\n\nPasos:\n1. Inicia sesión en mail.163.com\n2. Ve a Ajustes → POP3/SMTP/IMAP\n3. Activa el servicio IMAP/SMTP\n4. Sigue la verificación por SMS\n5. Ingresa el código de autorización arriba';

  @override
  String get emailGuideGmail =>
      '❌ Gmail requiere una \"Contraseña de aplicación\"\n\nPasos:\n1. Ve a myaccount.google.com\n2. Seguridad → Verificación en 2 pasos (debe estar activada)\n3. Busca \"Contraseñas de aplicación\" al final\n4. Selecciona Correo → Genera contraseña\n5. Ingresa la contraseña de 16 dígitos arriba\n\n⚠️ Si no encuentras Contraseñas de aplicación, activa primero la verificación en 2 pasos';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail requiere una \"Contraseña de aplicación\"\n\nPasos:\n1. Ve a account.microsoft.com\n2. Seguridad → Opciones de seguridad avanzadas\n3. Activa la verificación en dos pasos\n4. Crea una nueva contraseña de aplicación\n5. Ingresa la contraseña generada arriba';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail requiere una \"Contraseña específica de app\"\n\nPasos:\n1. Ve a appleid.apple.com e inicia sesión\n2. Inicio de sesión y seguridad → Contraseñas específicas de app\n3. Haz clic en \"Generar una contraseña\"\n4. Ingresa la contraseña arriba';

  @override
  String get emailGuideGeneric =>
      'Error de inicio de sesión. Posibles causas:\n\n1. Contraseña incorrecta — Muchos proveedores no permiten contraseñas de login para SMTP. Necesitas un \"Código de autorización\" o \"Contraseña de aplicación\"\n2. SMTP no activado — Inicia sesión en la web de tu email y activa SMTP en ajustes\n3. Límite de intentos — Demasiados intentos. Intenta más tarde\n\nConsulta los ajustes SMTP de tu proveedor.';

  @override
  String get purchaseFeatureCheckin => 'Guardia de registro';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Registro manual + automático, racha de días';

  @override
  String get purchaseFeatureAlert => 'Alerta de 3 niveles';

  @override
  String get purchaseFeatureAlertDesc =>
      'Aviso → email de timeout → email SOS de emergencia';

  @override
  String get purchaseFeatureLocation => 'Compartir ubicación';

  @override
  String get purchaseFeatureLocationDesc =>
      'GPS, enviada a contactos en emergencias';

  @override
  String get purchaseFeatureMessage => 'Último mensaje';

  @override
  String get purchaseFeatureMessageDesc =>
      'Escribe tus palabras, enviadas con emails de emergencia';

  @override
  String get purchaseUnlocked => 'Todas las funciones desbloqueadas';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Espacios actuales: $current (máx $max)';
  }

  @override
  String get purchaseAddContact => 'Agregar 1 espacio de contacto';

  @override
  String get noRecord => 'Sin registro';

  @override
  String get emailUsingDefault => 'Usando correo predeterminado';

  @override
  String get contactVerifyEmail => 'Verificar correo';

  @override
  String get contactVerifying => 'Verificando...';

  @override
  String get contactVerifySuccess =>
      'Correo de verificación enviado, pide al contacto que revise su bandeja';

  @override
  String get contactVerifyFail =>
      'Error al enviar, verifica la dirección de correo';
}
