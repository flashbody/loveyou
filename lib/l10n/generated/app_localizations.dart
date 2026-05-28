import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW')
  ];

  /// No description provided for @appName.
  ///
  /// In zh_CN, this message translates to:
  /// **'LoveYou'**
  String get appName;

  /// No description provided for @checkinButton.
  ///
  /// In zh_CN, this message translates to:
  /// **'爱你'**
  String get checkinButton;

  /// No description provided for @checkinSuccess.
  ///
  /// In zh_CN, this message translates to:
  /// **'签到成功 ❤️'**
  String get checkinSuccess;

  /// No description provided for @autoCheckinNotification.
  ///
  /// In zh_CN, this message translates to:
  /// **'今天已自动签到 ❤️'**
  String get autoCheckinNotification;

  /// No description provided for @streakDays.
  ///
  /// In zh_CN, this message translates to:
  /// **'连续签到 {count} 天'**
  String streakDays(int count);

  /// No description provided for @welcomeTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'LoveYou 守护你'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'每天一个「爱你」，让关心你的人安心'**
  String get welcomeSubtitle;

  /// No description provided for @setupName.
  ///
  /// In zh_CN, this message translates to:
  /// **'你的名字'**
  String get setupName;

  /// No description provided for @setupNameHint.
  ///
  /// In zh_CN, this message translates to:
  /// **'请输入你的姓名'**
  String get setupNameHint;

  /// No description provided for @setupContact.
  ///
  /// In zh_CN, this message translates to:
  /// **'紧急联系人'**
  String get setupContact;

  /// No description provided for @setupContactName.
  ///
  /// In zh_CN, this message translates to:
  /// **'联系人姓名'**
  String get setupContactName;

  /// No description provided for @setupContactEmail.
  ///
  /// In zh_CN, this message translates to:
  /// **'联系人邮箱'**
  String get setupContactEmail;

  /// No description provided for @setupDone.
  ///
  /// In zh_CN, this message translates to:
  /// **'开始守护'**
  String get setupDone;

  /// No description provided for @settingsTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'设置'**
  String get settingsTitle;

  /// No description provided for @settingsCheckinMode.
  ///
  /// In zh_CN, this message translates to:
  /// **'签到模式'**
  String get settingsCheckinMode;

  /// No description provided for @settingsManualMode.
  ///
  /// In zh_CN, this message translates to:
  /// **'手动签到'**
  String get settingsManualMode;

  /// No description provided for @settingsAutoMode.
  ///
  /// In zh_CN, this message translates to:
  /// **'自动签到'**
  String get settingsAutoMode;

  /// No description provided for @settingsCheckinInterval.
  ///
  /// In zh_CN, this message translates to:
  /// **'签到间隔'**
  String get settingsCheckinInterval;

  /// No description provided for @settingsInterval24h.
  ///
  /// In zh_CN, this message translates to:
  /// **'每 24 小时'**
  String get settingsInterval24h;

  /// No description provided for @settingsInterval12h.
  ///
  /// In zh_CN, this message translates to:
  /// **'每 12 小时'**
  String get settingsInterval12h;

  /// No description provided for @settingsInactivityThreshold.
  ///
  /// In zh_CN, this message translates to:
  /// **'无活动预警时间'**
  String get settingsInactivityThreshold;

  /// No description provided for @settingsInactivityHours.
  ///
  /// In zh_CN, this message translates to:
  /// **'{hours} 小时'**
  String settingsInactivityHours(int hours);

  /// No description provided for @settingsLanguage.
  ///
  /// In zh_CN, this message translates to:
  /// **'语言'**
  String get settingsLanguage;

  /// No description provided for @settingsAccessibility.
  ///
  /// In zh_CN, this message translates to:
  /// **'关爱模式（适老化）'**
  String get settingsAccessibility;

  /// No description provided for @settingsLastMessage.
  ///
  /// In zh_CN, this message translates to:
  /// **'遗言 / 留言'**
  String get settingsLastMessage;

  /// No description provided for @settingsContacts.
  ///
  /// In zh_CN, this message translates to:
  /// **'紧急联系人'**
  String get settingsContacts;

  /// No description provided for @settingsPurchase.
  ///
  /// In zh_CN, this message translates to:
  /// **'解锁全部功能'**
  String get settingsPurchase;

  /// No description provided for @contactsTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'紧急联系人'**
  String get contactsTitle;

  /// No description provided for @contactsAdd.
  ///
  /// In zh_CN, this message translates to:
  /// **'添加联系人'**
  String get contactsAdd;

  /// No description provided for @contactsMax.
  ///
  /// In zh_CN, this message translates to:
  /// **'最多 {max} 人'**
  String contactsMax(int max);

  /// No description provided for @contactsExtraCost.
  ///
  /// In zh_CN, this message translates to:
  /// **'额外联系人 ¥1.99/人'**
  String get contactsExtraCost;

  /// No description provided for @contactsDefault.
  ///
  /// In zh_CN, this message translates to:
  /// **'默认（含 1 人）'**
  String get contactsDefault;

  /// No description provided for @messageTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'遗言 / 留言'**
  String get messageTitle;

  /// No description provided for @messageHint.
  ///
  /// In zh_CN, this message translates to:
  /// **'写下你想对 TA 说的话...'**
  String get messageHint;

  /// No description provided for @messageSaved.
  ///
  /// In zh_CN, this message translates to:
  /// **'已保存'**
  String get messageSaved;

  /// No description provided for @purchaseTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'解锁 LoveYou'**
  String get purchaseTitle;

  /// No description provided for @purchaseDescription.
  ///
  /// In zh_CN, this message translates to:
  /// **'一次买断，终身守护'**
  String get purchaseDescription;

  /// No description provided for @purchasePrice.
  ///
  /// In zh_CN, this message translates to:
  /// **'¥8.00'**
  String get purchasePrice;

  /// No description provided for @purchaseButton.
  ///
  /// In zh_CN, this message translates to:
  /// **'立即解锁'**
  String get purchaseButton;

  /// No description provided for @purchaseRestoreButton.
  ///
  /// In zh_CN, this message translates to:
  /// **'恢复购买'**
  String get purchaseRestoreButton;

  /// No description provided for @alertPreWarning.
  ///
  /// In zh_CN, this message translates to:
  /// **'嘿，你还好吗？点一下 ❤️'**
  String get alertPreWarning;

  /// No description provided for @alertInactivityHours.
  ///
  /// In zh_CN, this message translates to:
  /// **'已超过 {hours} 小时未活动'**
  String alertInactivityHours(int hours);

  /// No description provided for @modeChangeNotice.
  ///
  /// In zh_CN, this message translates to:
  /// **'签到模式已切换，已通知所有紧急联系人'**
  String get modeChangeNotice;

  /// No description provided for @thresholdChangeNotice.
  ///
  /// In zh_CN, this message translates to:
  /// **'预警时间已更新，已通知所有紧急联系人'**
  String get thresholdChangeNotice;

  /// No description provided for @locationUnavailable.
  ///
  /// In zh_CN, this message translates to:
  /// **'位置不可用'**
  String get locationUnavailable;

  /// No description provided for @cancel.
  ///
  /// In zh_CN, this message translates to:
  /// **'取消'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In zh_CN, this message translates to:
  /// **'确认'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In zh_CN, this message translates to:
  /// **'保存'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In zh_CN, this message translates to:
  /// **'删除'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In zh_CN, this message translates to:
  /// **'编辑'**
  String get edit;

  /// No description provided for @done.
  ///
  /// In zh_CN, this message translates to:
  /// **'完成'**
  String get done;

  /// No description provided for @voiceListening.
  ///
  /// In zh_CN, this message translates to:
  /// **'正在听...'**
  String get voiceListening;

  /// No description provided for @voiceCheckin.
  ///
  /// In zh_CN, this message translates to:
  /// **'语音签到'**
  String get voiceCheckin;

  /// No description provided for @checkinReminderNotification.
  ///
  /// In zh_CN, this message translates to:
  /// **'别忘了今天签到哦 ❤️'**
  String get checkinReminderNotification;

  /// No description provided for @contactDeleteConfirm.
  ///
  /// In zh_CN, this message translates to:
  /// **'确定要删除此联系人吗？'**
  String get contactDeleteConfirm;

  /// No description provided for @messageDescription.
  ///
  /// In zh_CN, this message translates to:
  /// **'当预警触发时，这段话会随邮件一起发送给你的紧急联系人。'**
  String get messageDescription;

  /// No description provided for @emailSetupTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'邮箱设置'**
  String get emailSetupTitle;

  /// No description provided for @emailSetupHeading.
  ///
  /// In zh_CN, this message translates to:
  /// **'配置发信邮箱'**
  String get emailSetupHeading;

  /// No description provided for @emailSetupDescription.
  ///
  /// In zh_CN, this message translates to:
  /// **'当你未按时签到时，App 会通过这个邮箱给紧急联系人发送提醒邮件。'**
  String get emailSetupDescription;

  /// No description provided for @emailNotConfigured.
  ///
  /// In zh_CN, this message translates to:
  /// **'未配置（邮件无法发送）'**
  String get emailNotConfigured;

  /// No description provided for @emailSaved.
  ///
  /// In zh_CN, this message translates to:
  /// **'邮箱配置已保存'**
  String get emailSaved;

  /// No description provided for @emailTestSuccess.
  ///
  /// In zh_CN, this message translates to:
  /// **'测试邮件发送成功！请检查收件箱'**
  String get emailTestSuccess;

  /// No description provided for @emailProviderAuto.
  ///
  /// In zh_CN, this message translates to:
  /// **'自动检测'**
  String get emailProviderAuto;

  /// No description provided for @emailProviderQQ.
  ///
  /// In zh_CN, this message translates to:
  /// **'QQ 邮箱'**
  String get emailProviderQQ;

  /// No description provided for @emailProvider163.
  ///
  /// In zh_CN, this message translates to:
  /// **'网易 163'**
  String get emailProvider163;

  /// No description provided for @emailProviderCustom.
  ///
  /// In zh_CN, this message translates to:
  /// **'自定义 SMTP'**
  String get emailProviderCustom;

  /// No description provided for @emailProviderLabel.
  ///
  /// In zh_CN, this message translates to:
  /// **'邮箱类型'**
  String get emailProviderLabel;

  /// No description provided for @emailAddressLabel.
  ///
  /// In zh_CN, this message translates to:
  /// **'邮箱地址'**
  String get emailAddressLabel;

  /// No description provided for @emailAddressHint.
  ///
  /// In zh_CN, this message translates to:
  /// **'you@example.com'**
  String get emailAddressHint;

  /// No description provided for @emailAddressRequired.
  ///
  /// In zh_CN, this message translates to:
  /// **'请输入邮箱'**
  String get emailAddressRequired;

  /// No description provided for @emailAddressInvalid.
  ///
  /// In zh_CN, this message translates to:
  /// **'邮箱格式不正确'**
  String get emailAddressInvalid;

  /// No description provided for @emailPasswordLabel.
  ///
  /// In zh_CN, this message translates to:
  /// **'密码 / 授权码'**
  String get emailPasswordLabel;

  /// No description provided for @emailPasswordHint.
  ///
  /// In zh_CN, this message translates to:
  /// **'Gmail 用应用专用密码，QQ/163 用授权码'**
  String get emailPasswordHint;

  /// No description provided for @emailPasswordRequired.
  ///
  /// In zh_CN, this message translates to:
  /// **'请输入密码或授权码'**
  String get emailPasswordRequired;

  /// No description provided for @emailSmtpHost.
  ///
  /// In zh_CN, this message translates to:
  /// **'SMTP 服务器'**
  String get emailSmtpHost;

  /// No description provided for @emailSmtpHostRequired.
  ///
  /// In zh_CN, this message translates to:
  /// **'请输入 SMTP 服务器'**
  String get emailSmtpHostRequired;

  /// No description provided for @emailSmtpPort.
  ///
  /// In zh_CN, this message translates to:
  /// **'端口'**
  String get emailSmtpPort;

  /// No description provided for @emailTipTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'提示'**
  String get emailTipTitle;

  /// No description provided for @emailTipContent.
  ///
  /// In zh_CN, this message translates to:
  /// **'• Gmail：需开启「两步验证」后生成「应用专用密码」\n• QQ 邮箱：设置 → 账户 → 生成「授权码」\n• 163 邮箱：设置 → POP3/SMTP → 开启并获取授权码\n• 密码仅存储在你的手机本地，不会上传'**
  String get emailTipContent;

  /// No description provided for @emailSaveButton.
  ///
  /// In zh_CN, this message translates to:
  /// **'保存配置'**
  String get emailSaveButton;

  /// No description provided for @emailTestButton.
  ///
  /// In zh_CN, this message translates to:
  /// **'发送测试邮件'**
  String get emailTestButton;

  /// No description provided for @emailTesting.
  ///
  /// In zh_CN, this message translates to:
  /// **'发送中...'**
  String get emailTesting;

  /// No description provided for @emailErrorAuthTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'登录验证失败'**
  String get emailErrorAuthTitle;

  /// No description provided for @emailErrorNetworkTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'网络连接失败'**
  String get emailErrorNetworkTitle;

  /// No description provided for @emailErrorGenericTitle.
  ///
  /// In zh_CN, this message translates to:
  /// **'发送失败'**
  String get emailErrorGenericTitle;

  /// No description provided for @emailErrorGenericMsg.
  ///
  /// In zh_CN, this message translates to:
  /// **'错误信息：{error}'**
  String emailErrorGenericMsg(String error);

  /// No description provided for @emailErrorNetworkSteps.
  ///
  /// In zh_CN, this message translates to:
  /// **'1. 检查手机网络是否正常（Wi-Fi 或蜂窝数据）\n2. 如果使用 VPN，尝试关闭后重试\n3. 如果是自定义 SMTP，请确认服务器地址和端口是否正确\n4. 部分网络环境可能屏蔽了 465/587 端口，可尝试切换'**
  String get emailErrorNetworkSteps;

  /// No description provided for @emailErrorGenericSteps.
  ///
  /// In zh_CN, this message translates to:
  /// **'请检查：\n1. 邮箱地址是否正确\n2. 密码/授权码是否正确\n3. 网络是否正常'**
  String get emailErrorGenericSteps;

  /// No description provided for @emailErrorDismiss.
  ///
  /// In zh_CN, this message translates to:
  /// **'知道了'**
  String get emailErrorDismiss;

  /// No description provided for @emailGuideQQ.
  ///
  /// In zh_CN, this message translates to:
  /// **'❌ QQ/Foxmail 邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.qq.com 登录邮箱\n2. 点击「设置」→「账户」\n3. 找到「POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV 服务」\n4. 开启「IMAP/SMTP 服务」（需短信验证）\n5. 点击「生成授权码」\n6. 将 16 位授权码填入本页面的「密码/授权码」栏'**
  String get emailGuideQQ;

  /// No description provided for @emailGuide163.
  ///
  /// In zh_CN, this message translates to:
  /// **'❌ 网易邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.163.com 登录邮箱\n2. 点击「设置」→「POP3/SMTP/IMAP」\n3. 开启「IMAP/SMTP 服务」\n4. 按提示用手机发短信验证\n5. 获得授权码后填入本页面的「密码/授权码」栏'**
  String get emailGuide163;

  /// No description provided for @emailGuideGmail.
  ///
  /// In zh_CN, this message translates to:
  /// **'❌ Gmail 需要使用「应用专用密码」\n\n获取步骤：\n1. 打开 myaccount.google.com\n2. 进入「安全性」→「两步验证」（必须先开启）\n3. 在两步验证页面底部找到「应用专用密码」\n4. 选择「邮件」→ 生成密码\n5. 将 16 位密码填入本页面的「密码/授权码」栏\n\n⚠️ 如果找不到「应用专用密码」，请先确保已开启两步验证'**
  String get emailGuideGmail;

  /// No description provided for @emailGuideOutlook.
  ///
  /// In zh_CN, this message translates to:
  /// **'❌ Outlook/Hotmail 需要使用「应用密码」\n\n获取步骤：\n1. 打开 account.microsoft.com\n2. 进入「安全」→「高级安全选项」\n3. 开启「两步验证」\n4. 在「应用密码」中创建新密码\n5. 将生成的密码填入本页面'**
  String get emailGuideOutlook;

  /// No description provided for @emailGuideICloud.
  ///
  /// In zh_CN, this message translates to:
  /// **'❌ iCloud 邮箱需要使用「App 专用密码」\n\n获取步骤：\n1. 打开 appleid.apple.com 登录\n2. 进入「登录和安全」→「App 专用密码」\n3. 点击「生成 App 专用密码」\n4. 将密码填入本页面'**
  String get emailGuideICloud;

  /// No description provided for @emailGuideGeneric.
  ///
  /// In zh_CN, this message translates to:
  /// **'登录失败，可能的原因：\n\n1. 密码不正确 — 很多邮箱不允许直接使用登录密码，需要生成「授权码」或「应用专用密码」\n2. SMTP 服务未开启 — 请登录邮箱网页版，在设置中开启 SMTP 服务\n3. 登录频率限制 — 短时间内多次尝试可能被限制，请稍后重试\n\n建议去邮箱的「设置」页面查看 SMTP 相关选项。'**
  String get emailGuideGeneric;

  /// No description provided for @purchaseFeatureCheckin.
  ///
  /// In zh_CN, this message translates to:
  /// **'签到守护'**
  String get purchaseFeatureCheckin;

  /// No description provided for @purchaseFeatureCheckinDesc.
  ///
  /// In zh_CN, this message translates to:
  /// **'手动 + 自动签到、连续天数统计'**
  String get purchaseFeatureCheckinDesc;

  /// No description provided for @purchaseFeatureAlert.
  ///
  /// In zh_CN, this message translates to:
  /// **'三级预警'**
  String get purchaseFeatureAlert;

  /// No description provided for @purchaseFeatureAlertDesc.
  ///
  /// In zh_CN, this message translates to:
  /// **'预警 → 超时邮件 → SOS 紧急邮件'**
  String get purchaseFeatureAlertDesc;

  /// No description provided for @purchaseFeatureLocation.
  ///
  /// In zh_CN, this message translates to:
  /// **'位置共享'**
  String get purchaseFeatureLocation;

  /// No description provided for @purchaseFeatureLocationDesc.
  ///
  /// In zh_CN, this message translates to:
  /// **'GPS 定位，紧急时发送给联系人'**
  String get purchaseFeatureLocationDesc;

  /// No description provided for @purchaseFeatureMessage.
  ///
  /// In zh_CN, this message translates to:
  /// **'遗言留言'**
  String get purchaseFeatureMessage;

  /// No description provided for @purchaseFeatureMessageDesc.
  ///
  /// In zh_CN, this message translates to:
  /// **'写下想说的话，紧急时随邮件发送'**
  String get purchaseFeatureMessageDesc;

  /// No description provided for @purchaseUnlocked.
  ///
  /// In zh_CN, this message translates to:
  /// **'已解锁全部功能'**
  String get purchaseUnlocked;

  /// No description provided for @purchaseCurrentSlots.
  ///
  /// In zh_CN, this message translates to:
  /// **'当前名额：{current} 人（上限 {max}）'**
  String purchaseCurrentSlots(int current, int max);

  /// No description provided for @purchaseAddContact.
  ///
  /// In zh_CN, this message translates to:
  /// **'增加 1 个联系人名额'**
  String get purchaseAddContact;

  /// No description provided for @noRecord.
  ///
  /// In zh_CN, this message translates to:
  /// **'无记录'**
  String get noRecord;

  /// No description provided for @emailUsingDefault.
  ///
  /// In zh_CN, this message translates to:
  /// **'使用默认邮箱发送'**
  String get emailUsingDefault;

  /// No description provided for @contactVerifyEmail.
  ///
  /// In zh_CN, this message translates to:
  /// **'验证邮箱'**
  String get contactVerifyEmail;

  /// No description provided for @contactVerifying.
  ///
  /// In zh_CN, this message translates to:
  /// **'验证中...'**
  String get contactVerifying;

  /// No description provided for @contactVerifySuccess.
  ///
  /// In zh_CN, this message translates to:
  /// **'验证邮件已发送，请让联系人确认收件箱'**
  String get contactVerifySuccess;

  /// No description provided for @contactVerifyFail.
  ///
  /// In zh_CN, this message translates to:
  /// **'发送失败，请检查邮箱地址是否正确'**
  String get contactVerifyFail;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'ko',
        'pt',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
