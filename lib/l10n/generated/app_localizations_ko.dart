// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => '사랑해';

  @override
  String get checkinSuccess => '체크인 완료 ❤️';

  @override
  String get autoCheckinNotification => '오늘 자동 체크인 완료 ❤️';

  @override
  String streakDays(int count) {
    return '연속 $count일';
  }

  @override
  String get welcomeTitle => 'LoveYou가 지켜줄게요';

  @override
  String get welcomeSubtitle => '매일 \"사랑해\" 한마디로 소중한 사람에게 안심을';

  @override
  String get setupName => '이름';

  @override
  String get setupNameHint => '이름을 입력하세요';

  @override
  String get setupContact => '비상 연락처';

  @override
  String get setupContactName => '연락처 이름';

  @override
  String get setupContactEmail => '연락처 이메일';

  @override
  String get setupDone => '보호 시작';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsCheckinMode => '체크인 모드';

  @override
  String get settingsManualMode => '수동';

  @override
  String get settingsAutoMode => '자동';

  @override
  String get settingsCheckinInterval => '체크인 간격';

  @override
  String get settingsInterval24h => '24시간마다';

  @override
  String get settingsInterval12h => '12시간마다';

  @override
  String get settingsInactivityThreshold => '비활동 알림';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours시간';
  }

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsAccessibility => '케어 모드';

  @override
  String get settingsLastMessage => '마지막 메시지';

  @override
  String get settingsContacts => '비상 연락처';

  @override
  String get settingsPurchase => '기능 잠금 해제';

  @override
  String get contactsTitle => '비상 연락처';

  @override
  String get contactsAdd => '연락처 추가';

  @override
  String contactsMax(int max) {
    return '최대 $max명';
  }

  @override
  String contactsExtraCost(String price) {
    return '추가 연락처 $price/명';
  }

  @override
  String get contactsDefault => '기본 (1명 포함)';

  @override
  String get messageTitle => '마지막 메시지';

  @override
  String get messageHint => '전하고 싶은 말을 적어주세요...';

  @override
  String get messageSaved => '저장됨';

  @override
  String get purchaseTitle => 'LoveYou 잠금 해제';

  @override
  String get purchaseDescription => '한 번 구매, 평생 보호';

  @override
  String purchaseButton(String price) {
    return '지금 잠금 해제 ($price)';
  }

  @override
  String get purchaseRestoreButton => '구매 복원';

  @override
  String get alertPreWarning => '괜찮아요? 여기를 탭하세요 ❤️';

  @override
  String alertInactivityHours(int hours) {
    return '$hours시간 동안 활동 없음';
  }

  @override
  String get modeChangeNotice => '모드가 변경되었습니다. 비상 연락처에 알렸습니다.';

  @override
  String get thresholdChangeNotice => '알림 시간이 업데이트되었습니다. 연락처에 알렸습니다.';

  @override
  String get locationUnavailable => '위치를 사용할 수 없음';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get edit => '편집';

  @override
  String get done => '완료';

  @override
  String get voiceListening => '듣는 중...';

  @override
  String get voiceCheckin => '음성 체크인';

  @override
  String get checkinReminderNotification => '오늘 체크인하는 것을 잊지 마세요 ❤️';

  @override
  String get contactDeleteConfirm => '이 연락처를 삭제하시겠습니까?';

  @override
  String get messageDescription => '알림이 발동되면 이 메시지가 이메일로 비상 연락처에 전송됩니다.';

  @override
  String get emailSetupTitle => '이메일 설정';

  @override
  String get emailSetupHeading => '발신 이메일 설정';

  @override
  String get emailSetupDescription => '체크인을 놓치면 앱이 이 이메일을 사용하여 비상 연락처에 알립니다.';

  @override
  String get emailNotConfigured => '설정되지 않음 (이메일을 보낼 수 없음)';

  @override
  String get emailSaved => '이메일 설정이 저장되었습니다';

  @override
  String get emailTestSuccess => '테스트 이메일이 성공적으로 전송되었습니다! 받은편지함을 확인하세요';

  @override
  String get emailProviderAuto => '자동 감지';

  @override
  String get emailProviderQQ => 'QQ 메일';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => '사용자 지정 SMTP';

  @override
  String get emailProviderLabel => '이메일 제공업체';

  @override
  String get emailAddressLabel => '이메일 주소';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => '이메일을 입력해 주세요';

  @override
  String get emailAddressInvalid => '잘못된 이메일 형식입니다';

  @override
  String get emailPasswordLabel => '비밀번호 / 인증 코드';

  @override
  String get emailPasswordHint => 'Gmail: 앱 비밀번호, QQ/163: 인증 코드';

  @override
  String get emailPasswordRequired => '비밀번호 또는 인증 코드를 입력해 주세요';

  @override
  String get emailSmtpHost => 'SMTP 서버';

  @override
  String get emailSmtpHostRequired => 'SMTP 서버를 입력해 주세요';

  @override
  String get emailSmtpPort => '포트';

  @override
  String get emailTipTitle => '도움말';

  @override
  String get emailTipContent =>
      '• Gmail: 2단계 인증을 활성화한 후 앱 비밀번호를 생성하세요\n• QQ 메일: 설정 → 계정 → 인증 코드 생성\n• 163 메일: 설정 → POP3/SMTP → 활성화 후 코드 받기\n• 비밀번호는 기기에 로컬로만 저장됩니다';

  @override
  String get emailSaveButton => '설정 저장';

  @override
  String get emailTestButton => '테스트 이메일 보내기';

  @override
  String get emailTesting => '전송 중...';

  @override
  String get emailErrorAuthTitle => '인증 실패';

  @override
  String get emailErrorNetworkTitle => '네트워크 연결 실패';

  @override
  String get emailErrorGenericTitle => '전송 실패';

  @override
  String emailErrorGenericMsg(String error) {
    return '오류: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. 네트워크 연결을 확인하세요 (Wi-Fi 또는 모바일 데이터)\n2. VPN을 사용 중이라면 비활성화해 보세요\n3. 사용자 지정 SMTP의 경우 서버 주소와 포트를 확인하세요\n4. 일부 네트워크에서는 포트 465/587이 차단됩니다. 변경해 보세요';

  @override
  String get emailErrorGenericSteps =>
      '다음을 확인해 주세요:\n1. 이메일 주소가 올바른지\n2. 비밀번호/인증 코드가 올바른지\n3. 네트워크가 정상인지';

  @override
  String get emailErrorDismiss => '확인';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail은 로그인 비밀번호 대신 인증 코드가 필요합니다\n\n단계:\n1. mail.qq.com에 로그인\n2. 설정 → 계정으로 이동\n3. POP3/IMAP/SMTP 서비스 찾기\n4. IMAP/SMTP 활성화 (SMS 인증 필요)\n5. 인증 코드 생성 클릭\n6. 위의 비밀번호 란에 16자리 코드 입력';

  @override
  String get emailGuide163 =>
      '❌ NetEase 메일은 인증 코드가 필요합니다\n\n단계:\n1. mail.163.com에 로그인\n2. 설정 → POP3/SMTP/IMAP으로 이동\n3. IMAP/SMTP 서비스 활성화\n4. SMS 인증 절차 따르기\n5. 위의 비밀번호 란에 인증 코드 입력';

  @override
  String get emailGuideGmail =>
      '❌ Gmail은 앱 비밀번호가 필요합니다\n\n단계:\n1. myaccount.google.com으로 이동\n2. 보안 → 2단계 인증 (활성화 필요)\n3. 하단에서 앱 비밀번호 찾기\n4. 메일 → 비밀번호 생성 선택\n5. 위에 16자리 비밀번호 입력\n\n⚠️ 앱 비밀번호를 찾을 수 없다면 먼저 2단계 인증을 활성화하세요';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail은 앱 비밀번호가 필요합니다\n\n단계:\n1. account.microsoft.com으로 이동\n2. 보안 → 고급 보안 옵션\n3. 2단계 인증 활성화\n4. 새 앱 비밀번호 만들기\n5. 위에 생성된 비밀번호 입력';

  @override
  String get emailGuideICloud =>
      '❌ iCloud 메일은 앱 전용 암호가 필요합니다\n\n단계:\n1. appleid.apple.com에 접속하여 로그인\n2. 로그인 및 보안 → 앱 전용 암호\n3. 앱 전용 암호 생성 클릭\n4. 위에 비밀번호 입력';

  @override
  String get emailGuideGeneric =>
      '로그인에 실패했습니다. 가능한 원인:\n\n1. 잘못된 비밀번호 — 많은 제공업체에서 SMTP에 로그인 비밀번호를 허용하지 않습니다. 인증 코드 또는 앱 비밀번호가 필요할 수 있습니다\n2. SMTP 미활성화 — 이메일 웹 인터페이스에 로그인하여 SMTP를 활성화하세요\n3. 요청 제한 — 시도 횟수가 너무 많습니다. 나중에 다시 시도하세요\n\n이메일 제공업체의 SMTP 설정을 확인하세요.';

  @override
  String get purchaseFeatureCheckin => '체크인 가드';

  @override
  String get purchaseFeatureCheckinDesc => '수동 + 자동 체크인, 연속 기록 추적';

  @override
  String get purchaseFeatureAlert => '3단계 알림';

  @override
  String get purchaseFeatureAlertDesc => '경고 → 시간 초과 이메일 → SOS 긴급 이메일';

  @override
  String get purchaseFeatureLocation => '위치 공유';

  @override
  String get purchaseFeatureLocationDesc => 'GPS 위치, 긴급 상황 시 연락처에 전송';

  @override
  String get purchaseFeatureMessage => '마지막 메시지';

  @override
  String get purchaseFeatureMessageDesc => '전하고 싶은 말을 작성하여 긴급 이메일과 함께 전송';

  @override
  String get purchaseUnlocked => '모든 기능이 잠금 해제되었습니다';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return '현재 슬롯: $current (최대 $max)';
  }

  @override
  String get purchaseAddContact => '연락처 슬롯 1개 추가';

  @override
  String get noRecord => '기록 없음';

  @override
  String get emailUsingDefault => '기본 이메일 사용 중';

  @override
  String get contactVerifyEmail => '이메일 확인';

  @override
  String get contactVerifying => '확인 중...';

  @override
  String get contactVerifySuccess => '확인 이메일이 전송되었습니다. 연락처에게 수신함을 확인하도록 요청하세요';

  @override
  String get contactVerifyFail => '전송 실패, 이메일 주소를 확인해 주세요';

  @override
  String get paywallTitle => '기능 잠김';

  @override
  String get paywallMessage =>
      '이 기능은 구매 후 활성화됩니다. 지금 잠금 해제하여 모든 보호 기능을 활성화하세요.';

  @override
  String get paywallUnlock => '잠금 해제';

  @override
  String get paywallContactTitle => '연락처 슬롯 부족';

  @override
  String get paywallContactMessage =>
      '무료 슬롯을 모두 사용했습니다. 추가 슬롯을 구매하여 연락처를 더 추가하세요.';
}
