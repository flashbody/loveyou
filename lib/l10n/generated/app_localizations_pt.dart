// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => 'Te Amo';

  @override
  String get checkinSuccess => 'Check-in feito ❤️';

  @override
  String get autoCheckinNotification => 'Check-in automático hoje ❤️';

  @override
  String streakDays(int count) {
    return '$count dias seguidos';
  }

  @override
  String get welcomeTitle => 'LoveYou cuida de você';

  @override
  String get welcomeSubtitle => 'Um \"Te Amo\" por dia tranquiliza quem te ama';

  @override
  String get setupName => 'Seu nome';

  @override
  String get setupNameHint => 'Digite seu nome';

  @override
  String get setupContact => 'Contato de emergência';

  @override
  String get setupContactName => 'Nome do contato';

  @override
  String get setupContactEmail => 'Email do contato';

  @override
  String get setupDone => 'Iniciar proteção';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsCheckinMode => 'Modo de check-in';

  @override
  String get settingsManualMode => 'Manual';

  @override
  String get settingsAutoMode => 'Automático';

  @override
  String get settingsCheckinInterval => 'Intervalo de check-in';

  @override
  String get settingsInterval24h => 'A cada 24 horas';

  @override
  String get settingsInterval12h => 'A cada 12 horas';

  @override
  String get settingsInactivityThreshold => 'Alerta de inatividade';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours horas';
  }

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsAccessibility => 'Modo acessibilidade';

  @override
  String get settingsLastMessage => 'Última mensagem';

  @override
  String get settingsContacts => 'Contatos de emergência';

  @override
  String get settingsPurchase => 'Desbloquear funções';

  @override
  String get contactsTitle => 'Contatos de emergência';

  @override
  String get contactsAdd => 'Adicionar contato';

  @override
  String contactsMax(int max) {
    return 'Até $max contatos';
  }

  @override
  String contactsExtraCost(String price) {
    return 'Contato extra $price cada';
  }

  @override
  String get contactsDefault => 'Padrão (1 incluído)';

  @override
  String get messageTitle => 'Última mensagem';

  @override
  String get messageHint => 'Escreva o que quer dizer a eles...';

  @override
  String get messageSaved => 'Salvo';

  @override
  String get purchaseTitle => 'Desbloquear LoveYou';

  @override
  String get purchaseDescription => 'Compra única, proteção vitalícia';

  @override
  String purchaseButton(String price) {
    return 'Desbloquear agora ($price)';
  }

  @override
  String get purchaseRestoreButton => 'Restaurar compra';

  @override
  String get alertPreWarning => 'Ei, tudo bem? Toque aqui ❤️';

  @override
  String alertInactivityHours(int hours) {
    return 'Sem atividade por $hours horas';
  }

  @override
  String get modeChangeNotice =>
      'Modo alterado. Contatos de emergência notificados.';

  @override
  String get thresholdChangeNotice =>
      'Tempo de alerta atualizado. Contatos notificados.';

  @override
  String get locationUnavailable => 'Localização indisponível';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String get done => 'Concluído';

  @override
  String get voiceListening => 'Ouvindo...';

  @override
  String get voiceCheckin => 'Check-in por voz';

  @override
  String get checkinReminderNotification =>
      'Não esqueça de fazer o check-in hoje ❤️';

  @override
  String get contactDeleteConfirm =>
      'Tem certeza de que deseja excluir este contato?';

  @override
  String get messageDescription =>
      'Quando um alerta for acionado, esta mensagem será enviada aos seus contatos de emergência por e-mail.';

  @override
  String get emailSetupTitle => 'Configuração de e-mail';

  @override
  String get emailSetupHeading => 'Configurar e-mail de envio';

  @override
  String get emailSetupDescription =>
      'Quando você perder um check-in, o app usará este e-mail para notificar seus contatos de emergência.';

  @override
  String get emailNotConfigured =>
      'Não configurado (e-mails não podem ser enviados)';

  @override
  String get emailSaved => 'Configuração de e-mail salva';

  @override
  String get emailTestSuccess =>
      'E-mail de teste enviado com sucesso! Verifique sua caixa de entrada';

  @override
  String get emailProviderAuto => 'Detecção automática';

  @override
  String get emailProviderQQ => 'QQ Mail';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'SMTP personalizado';

  @override
  String get emailProviderLabel => 'Provedor de e-mail';

  @override
  String get emailAddressLabel => 'Endereço de e-mail';

  @override
  String get emailAddressHint => 'voce@exemplo.com';

  @override
  String get emailAddressRequired => 'Por favor, insira seu e-mail';

  @override
  String get emailAddressInvalid => 'Formato de e-mail inválido';

  @override
  String get emailPasswordLabel => 'Senha / Código de autenticação';

  @override
  String get emailPasswordHint =>
      'Gmail: senha de app, QQ/163: código de autenticação';

  @override
  String get emailPasswordRequired =>
      'Por favor, insira a senha ou código de autenticação';

  @override
  String get emailSmtpHost => 'Servidor SMTP';

  @override
  String get emailSmtpHostRequired => 'Por favor, insira o servidor SMTP';

  @override
  String get emailSmtpPort => 'Porta';

  @override
  String get emailTipTitle => 'Dicas';

  @override
  String get emailTipContent =>
      '• Gmail: Ative a Verificação em duas etapas, depois gere uma Senha de app\n• QQ Mail: Configurações → Conta → Gerar código de autenticação\n• 163 Mail: Configurações → POP3/SMTP → Ative e obtenha o código\n• As senhas são armazenadas apenas localmente no seu dispositivo';

  @override
  String get emailSaveButton => 'Salvar configuração';

  @override
  String get emailTestButton => 'Enviar e-mail de teste';

  @override
  String get emailTesting => 'Enviando...';

  @override
  String get emailErrorAuthTitle => 'Falha na autenticação';

  @override
  String get emailErrorNetworkTitle => 'Falha na conexão de rede';

  @override
  String get emailErrorGenericTitle => 'Falha no envio';

  @override
  String emailErrorGenericMsg(String error) {
    return 'Erro: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. Verifique sua conexão de rede (Wi-Fi ou dados móveis)\n2. Se estiver usando VPN, tente desativá-la\n3. Para SMTP personalizado, verifique o endereço e a porta do servidor\n4. Algumas redes bloqueiam as portas 465/587, tente trocar';

  @override
  String get emailErrorGenericSteps =>
      'Por favor, verifique:\n1. O endereço de e-mail está correto\n2. A senha/código de autenticação está correto\n3. A rede está funcionando';

  @override
  String get emailErrorDismiss => 'OK';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail requer um Código de Autenticação em vez da senha de login\n\nPassos:\n1. Acesse mail.qq.com\n2. Vá em Configurações → Conta\n3. Encontre o serviço POP3/IMAP/SMTP\n4. Ative IMAP/SMTP (verificação por SMS necessária)\n5. Clique em Gerar Código de Autenticação\n6. Insira o código de 16 dígitos no campo de senha acima';

  @override
  String get emailGuide163 =>
      '❌ NetEase Mail requer um Código de Autenticação\n\nPassos:\n1. Acesse mail.163.com\n2. Vá em Configurações → POP3/SMTP/IMAP\n3. Ative o serviço IMAP/SMTP\n4. Siga a verificação por SMS\n5. Insira o código de autenticação no campo de senha acima';

  @override
  String get emailGuideGmail =>
      '❌ Gmail requer uma Senha de App\n\nPassos:\n1. Acesse myaccount.google.com\n2. Segurança → Verificação em duas etapas (deve estar ativada)\n3. Encontre Senhas de app no final\n4. Selecione E-mail → Gerar senha\n5. Insira a senha de 16 dígitos acima\n\n⚠️ Se não encontrar Senhas de app, ative a Verificação em duas etapas primeiro';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail requer uma Senha de App\n\nPassos:\n1. Acesse account.microsoft.com\n2. Segurança → Opções avançadas de segurança\n3. Ative a Verificação em duas etapas\n4. Crie uma nova Senha de app\n5. Insira a senha gerada acima';

  @override
  String get emailGuideICloud =>
      '❌ iCloud Mail requer uma Senha Específica de App\n\nPassos:\n1. Acesse appleid.apple.com e faça login\n2. Início de sessão e segurança → Senhas específicas de apps\n3. Clique em Gerar uma senha específica de app\n4. Insira a senha acima';

  @override
  String get emailGuideGeneric =>
      'Falha no login. Possíveis motivos:\n\n1. Senha incorreta — Muitos provedores não permitem senha de login para SMTP. Você pode precisar de um Código de Autenticação ou Senha de App\n2. SMTP não ativado — Acesse a interface web do seu e-mail e ative o SMTP\n3. Limite de tentativas — Muitas tentativas. Tente novamente mais tarde\n\nVerifique as configurações SMTP do seu provedor de e-mail.';

  @override
  String get purchaseFeatureCheckin => 'Guarda de check-in';

  @override
  String get purchaseFeatureCheckinDesc =>
      'Check-in manual + automático, registro de sequência';

  @override
  String get purchaseFeatureAlert => 'Alerta de 3 níveis';

  @override
  String get purchaseFeatureAlertDesc =>
      'Aviso → e-mail de tempo esgotado → e-mail de emergência SOS';

  @override
  String get purchaseFeatureLocation => 'Compartilhamento de localização';

  @override
  String get purchaseFeatureLocationDesc =>
      'Localização GPS, enviada aos contatos em emergências';

  @override
  String get purchaseFeatureMessage => 'Última mensagem';

  @override
  String get purchaseFeatureMessageDesc =>
      'Escreva suas palavras, enviadas com e-mails de emergência';

  @override
  String get purchaseUnlocked => 'Todas as funções desbloqueadas';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return 'Vagas atuais: $current (máximo $max)';
  }

  @override
  String get purchaseAddContact => 'Adicionar 1 vaga de contato';

  @override
  String get noRecord => 'Sem registro';

  @override
  String get emailUsingDefault => 'Usando email padrão';

  @override
  String get contactVerifyEmail => 'Verificar email';

  @override
  String get contactVerifying => 'Verificando...';

  @override
  String get contactVerifySuccess =>
      'Email de verificação enviado, peça ao contato para verificar a caixa de entrada';

  @override
  String get contactVerifyFail =>
      'Falha ao enviar, verifique o endereço de email';

  @override
  String get paywallTitle => 'Recurso bloqueado';

  @override
  String get paywallMessage =>
      'Este recurso requer uma compra para ser ativado. Desbloqueie agora para ativar a proteção completa.';

  @override
  String get paywallUnlock => 'Desbloquear';

  @override
  String get paywallContactTitle => 'Vagas de contato esgotadas';

  @override
  String get paywallContactMessage =>
      'Todas as vagas gratuitas foram usadas. Compre vagas adicionais para adicionar mais contatos.';
}
