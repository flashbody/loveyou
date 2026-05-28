// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => '愛してる';

  @override
  String get checkinSuccess => 'チェックイン完了 ❤️';

  @override
  String get autoCheckinNotification => '今日は自動チェックインしました ❤️';

  @override
  String streakDays(int count) {
    return '連続 $count 日';
  }

  @override
  String get welcomeTitle => 'LoveYou があなたを見守ります';

  @override
  String get welcomeSubtitle => '毎日の「愛してる」で、大切な人に安心を';

  @override
  String get setupName => 'あなたの名前';

  @override
  String get setupNameHint => '名前を入力してください';

  @override
  String get setupContact => '緊急連絡先';

  @override
  String get setupContactName => '連絡先の名前';

  @override
  String get setupContactEmail => '連絡先のメール';

  @override
  String get setupDone => '見守りを開始';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsCheckinMode => 'チェックインモード';

  @override
  String get settingsManualMode => '手動';

  @override
  String get settingsAutoMode => '自動';

  @override
  String get settingsCheckinInterval => 'チェックイン間隔';

  @override
  String get settingsInterval24h => '24時間ごと';

  @override
  String get settingsInterval12h => '12時間ごと';

  @override
  String get settingsInactivityThreshold => '非活動アラート';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours 時間';
  }

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsAccessibility => 'ケアモード';

  @override
  String get settingsLastMessage => '最後のメッセージ';

  @override
  String get settingsContacts => '緊急連絡先';

  @override
  String get settingsPurchase => '機能をアンロック';

  @override
  String get contactsTitle => '緊急連絡先';

  @override
  String get contactsAdd => '連絡先を追加';

  @override
  String contactsMax(int max) {
    return '最大 $max 人';
  }

  @override
  String get contactsExtraCost => '追加連絡先 ¥160/人';

  @override
  String get contactsDefault => 'デフォルト（1人含む）';

  @override
  String get messageTitle => '最後のメッセージ';

  @override
  String get messageHint => '伝えたい言葉を書いてください...';

  @override
  String get messageSaved => '保存しました';

  @override
  String get purchaseTitle => 'LoveYou をアンロック';

  @override
  String get purchaseDescription => '一度の購入で、一生の見守り';

  @override
  String get purchasePrice => '¥160';

  @override
  String get purchaseButton => '今すぐアンロック';

  @override
  String get purchaseRestoreButton => '購入を復元';

  @override
  String get alertPreWarning => '大丈夫？ここをタップ ❤️';

  @override
  String alertInactivityHours(int hours) {
    return '$hours 時間活動がありません';
  }

  @override
  String get modeChangeNotice => 'モードが変更されました。緊急連絡先に通知しました。';

  @override
  String get thresholdChangeNotice => 'アラート時間を更新しました。連絡先に通知しました。';

  @override
  String get locationUnavailable => '位置情報が利用できません';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get done => '完了';

  @override
  String get voiceListening => '聞き取り中...';

  @override
  String get voiceCheckin => '音声チェックイン';

  @override
  String get checkinReminderNotification => '今日のチェックインを忘れずに ❤️';

  @override
  String get contactDeleteConfirm => 'この連絡先を削除してもよろしいですか？';

  @override
  String get messageDescription => 'アラートが発動されると、このメッセージがメールで緊急連絡先に送信されます。';

  @override
  String get emailSetupTitle => 'メール設定';

  @override
  String get emailSetupHeading => '送信メールの設定';

  @override
  String get emailSetupDescription => 'チェックインを忘れた場合、アプリはこのメールを使って緊急連絡先に通知します。';

  @override
  String get emailNotConfigured => '未設定（メールを送信できません）';

  @override
  String get emailSaved => 'メール設定を保存しました';

  @override
  String get emailTestSuccess => 'テストメールを送信しました！受信トレイを確認してください';

  @override
  String get emailProviderAuto => '自動検出';

  @override
  String get emailProviderQQ => 'QQメール';

  @override
  String get emailProvider163 => 'NetEase 163';

  @override
  String get emailProviderCustom => 'カスタムSMTP';

  @override
  String get emailProviderLabel => 'メールプロバイダー';

  @override
  String get emailAddressLabel => 'メールアドレス';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => 'メールアドレスを入力してください';

  @override
  String get emailAddressInvalid => 'メールアドレスの形式が無効です';

  @override
  String get emailPasswordLabel => 'パスワード / 認証コード';

  @override
  String get emailPasswordHint => 'Gmail: アプリパスワード、QQ/163: 認証コード';

  @override
  String get emailPasswordRequired => 'パスワードまたは認証コードを入力してください';

  @override
  String get emailSmtpHost => 'SMTPサーバー';

  @override
  String get emailSmtpHostRequired => 'SMTPサーバーを入力してください';

  @override
  String get emailSmtpPort => 'ポート';

  @override
  String get emailTipTitle => 'ヒント';

  @override
  String get emailTipContent =>
      '• Gmail: 2段階認証を有効にし、アプリパスワードを生成\n• QQメール: 設定 → アカウント → 認証コードを生成\n• 163メール: 設定 → POP3/SMTP → 有効にしてコードを取得\n• パスワードはデバイスのローカルにのみ保存されます';

  @override
  String get emailSaveButton => '設定を保存';

  @override
  String get emailTestButton => 'テストメールを送信';

  @override
  String get emailTesting => '送信中...';

  @override
  String get emailErrorAuthTitle => '認証に失敗しました';

  @override
  String get emailErrorNetworkTitle => 'ネットワーク接続に失敗しました';

  @override
  String get emailErrorGenericTitle => '送信に失敗しました';

  @override
  String emailErrorGenericMsg(String error) {
    return 'エラー: $error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. ネットワーク接続を確認してください（Wi-Fiまたはモバイルデータ）\n2. VPNを使用している場合は、オフにしてみてください\n3. カスタムSMTPの場合、サーバーアドレスとポートを確認してください\n4. 一部のネットワークではポート465/587がブロックされています。切り替えてみてください';

  @override
  String get emailErrorGenericSteps =>
      '以下を確認してください：\n1. メールアドレスが正しいか\n2. パスワード/認証コードが正しいか\n3. ネットワークが正常か';

  @override
  String get emailErrorDismiss => 'OK';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmailはログインパスワードではなく認証コードが必要です\n\n手順：\n1. mail.qq.comにログイン\n2. 設定 → アカウントに移動\n3. POP3/IMAP/SMTPサービスを見つける\n4. IMAP/SMTPを有効にする（SMS認証が必要）\n5. 認証コードを生成をクリック\n6. 上のパスワード欄に16桁のコードを入力';

  @override
  String get emailGuide163 =>
      '❌ NetEaseメールは認証コードが必要です\n\n手順：\n1. mail.163.comにログイン\n2. 設定 → POP3/SMTP/IMAPに移動\n3. IMAP/SMTPサービスを有効にする\n4. SMS認証の手順に従う\n5. 上のパスワード欄に認証コードを入力';

  @override
  String get emailGuideGmail =>
      '❌ Gmailはアプリパスワードが必要です\n\n手順：\n1. myaccount.google.comにアクセス\n2. セキュリティ → 2段階認証（有効にする必要があります）\n3. 下部のアプリパスワードを見つける\n4. メール → パスワードを生成を選択\n5. 上に16桁のパスワードを入力\n\n⚠️ アプリパスワードが見つからない場合は、まず2段階認証を有効にしてください';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmailはアプリパスワードが必要です\n\n手順：\n1. account.microsoft.comにアクセス\n2. セキュリティ → 高度なセキュリティオプション\n3. 2段階認証を有効にする\n4. 新しいアプリパスワードを作成\n5. 上に生成されたパスワードを入力';

  @override
  String get emailGuideICloud =>
      '❌ iCloudメールはApp用パスワードが必要です\n\n手順：\n1. appleid.apple.comにアクセスしてサインイン\n2. サインインとセキュリティ → App用パスワード\n3. App用パスワードを生成をクリック\n4. 上にパスワードを入力';

  @override
  String get emailGuideGeneric =>
      'ログインに失敗しました。考えられる原因：\n\n1. パスワードが間違っている — 多くのプロバイダーはSMTPにログインパスワードを使用できません。認証コードまたはアプリパスワードが必要な場合があります\n2. SMTPが有効でない — メールのWeb画面にログインしてSMTPを有効にしてください\n3. レート制限 — 試行回数が多すぎます。しばらくしてから再試行してください\n\nメールプロバイダーのSMTP設定を確認してください。';

  @override
  String get purchaseFeatureCheckin => 'チェックインガード';

  @override
  String get purchaseFeatureCheckinDesc => '手動 + 自動チェックイン、連続記録の追跡';

  @override
  String get purchaseFeatureAlert => '3段階アラート';

  @override
  String get purchaseFeatureAlertDesc => '警告 → タイムアウトメール → SOS緊急メール';

  @override
  String get purchaseFeatureLocation => '位置情報の共有';

  @override
  String get purchaseFeatureLocationDesc => 'GPS位置情報、緊急時に連絡先に送信';

  @override
  String get purchaseFeatureMessage => '最後のメッセージ';

  @override
  String get purchaseFeatureMessageDesc => 'あなたの言葉を書いて、緊急メールと一緒に送信';

  @override
  String get purchaseUnlocked => 'すべての機能がアンロックされました';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return '現在の枠: $current（最大 $max）';
  }

  @override
  String get purchaseAddContact => '連絡先枠を1つ追加';

  @override
  String get noRecord => '記録なし';

  @override
  String get emailUsingDefault => 'デフォルトメールを使用中';

  @override
  String get contactVerifyEmail => 'メールを確認';

  @override
  String get contactVerifying => '確認中...';

  @override
  String get contactVerifySuccess => '確認メールを送信しました。連絡先に受信箱を確認してもらってください';

  @override
  String get contactVerifyFail => '送信に失敗しました。メールアドレスを確認してください';
}
