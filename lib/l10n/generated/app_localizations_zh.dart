// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => '爱你';

  @override
  String get checkinSuccess => '签到成功 ❤️';

  @override
  String get autoCheckinNotification => '今天已自动签到 ❤️';

  @override
  String streakDays(int count) {
    return '连续签到 $count 天';
  }

  @override
  String get welcomeTitle => 'LoveYou 守护你';

  @override
  String get welcomeSubtitle => '每天一个「爱你」，让关心你的人安心';

  @override
  String get setupName => '你的名字';

  @override
  String get setupNameHint => '请输入你的姓名';

  @override
  String get setupContact => '紧急联系人';

  @override
  String get setupContactName => '联系人姓名';

  @override
  String get setupContactEmail => '联系人邮箱';

  @override
  String get setupDone => '开始守护';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsCheckinMode => '签到模式';

  @override
  String get settingsManualMode => '手动签到';

  @override
  String get settingsAutoMode => '自动签到';

  @override
  String get settingsCheckinInterval => '签到间隔';

  @override
  String get settingsInterval24h => '每 24 小时';

  @override
  String get settingsInterval12h => '每 12 小时';

  @override
  String get settingsInactivityThreshold => '无活动预警时间';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours 小时';
  }

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsAccessibility => '关爱模式（适老化）';

  @override
  String get settingsLastMessage => '遗言 / 留言';

  @override
  String get settingsContacts => '紧急联系人';

  @override
  String get settingsPurchase => '解锁全部功能';

  @override
  String get contactsTitle => '紧急联系人';

  @override
  String get contactsAdd => '添加联系人';

  @override
  String contactsMax(int max) {
    return '最多 $max 人';
  }

  @override
  String get contactsExtraCost => '额外联系人 ¥1.99/人';

  @override
  String get contactsDefault => '默认（含 1 人）';

  @override
  String get messageTitle => '遗言 / 留言';

  @override
  String get messageHint => '写下你想对 TA 说的话...';

  @override
  String get messageSaved => '已保存';

  @override
  String get purchaseTitle => '解锁 LoveYou';

  @override
  String get purchaseDescription => '一次买断，终身守护';

  @override
  String get purchasePrice => '¥8.00';

  @override
  String get purchaseButton => '立即解锁';

  @override
  String get purchaseRestoreButton => '恢复购买';

  @override
  String get alertPreWarning => '嘿，你还好吗？点一下 ❤️';

  @override
  String alertInactivityHours(int hours) {
    return '已超过 $hours 小时未活动';
  }

  @override
  String get modeChangeNotice => '签到模式已切换，已通知所有紧急联系人';

  @override
  String get thresholdChangeNotice => '预警时间已更新，已通知所有紧急联系人';

  @override
  String get locationUnavailable => '位置不可用';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get edit => '编辑';

  @override
  String get done => '完成';

  @override
  String get voiceListening => '正在听...';

  @override
  String get voiceCheckin => '语音签到';

  @override
  String get checkinReminderNotification => '别忘了今天签到哦 ❤️';

  @override
  String get contactDeleteConfirm => '确定要删除此联系人吗？';

  @override
  String get messageDescription => '当预警触发时，这段话会随邮件一起发送给你的紧急联系人。';

  @override
  String get emailSetupTitle => '邮箱设置';

  @override
  String get emailSetupHeading => '配置发信邮箱';

  @override
  String get emailSetupDescription => '当你未按时签到时，App 会通过这个邮箱给紧急联系人发送提醒邮件。';

  @override
  String get emailNotConfigured => '未配置（邮件无法发送）';

  @override
  String get emailSaved => '邮箱配置已保存';

  @override
  String get emailTestSuccess => '测试邮件发送成功！请检查收件箱';

  @override
  String get emailProviderAuto => '自动检测';

  @override
  String get emailProviderQQ => 'QQ 邮箱';

  @override
  String get emailProvider163 => '网易 163';

  @override
  String get emailProviderCustom => '自定义 SMTP';

  @override
  String get emailProviderLabel => '邮箱类型';

  @override
  String get emailAddressLabel => '邮箱地址';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => '请输入邮箱';

  @override
  String get emailAddressInvalid => '邮箱格式不正确';

  @override
  String get emailPasswordLabel => '密码 / 授权码';

  @override
  String get emailPasswordHint => 'Gmail 用应用专用密码，QQ/163 用授权码';

  @override
  String get emailPasswordRequired => '请输入密码或授权码';

  @override
  String get emailSmtpHost => 'SMTP 服务器';

  @override
  String get emailSmtpHostRequired => '请输入 SMTP 服务器';

  @override
  String get emailSmtpPort => '端口';

  @override
  String get emailTipTitle => '提示';

  @override
  String get emailTipContent =>
      '• Gmail：需开启「两步验证」后生成「应用专用密码」\n• QQ 邮箱：设置 → 账户 → 生成「授权码」\n• 163 邮箱：设置 → POP3/SMTP → 开启并获取授权码\n• 密码仅存储在你的手机本地，不会上传';

  @override
  String get emailSaveButton => '保存配置';

  @override
  String get emailTestButton => '发送测试邮件';

  @override
  String get emailTesting => '发送中...';

  @override
  String get emailErrorAuthTitle => '登录验证失败';

  @override
  String get emailErrorNetworkTitle => '网络连接失败';

  @override
  String get emailErrorGenericTitle => '发送失败';

  @override
  String emailErrorGenericMsg(String error) {
    return '错误信息：$error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. 检查手机网络是否正常（Wi-Fi 或蜂窝数据）\n2. 如果使用 VPN，尝试关闭后重试\n3. 如果是自定义 SMTP，请确认服务器地址和端口是否正确\n4. 部分网络环境可能屏蔽了 465/587 端口，可尝试切换';

  @override
  String get emailErrorGenericSteps =>
      '请检查：\n1. 邮箱地址是否正确\n2. 密码/授权码是否正确\n3. 网络是否正常';

  @override
  String get emailErrorDismiss => '知道了';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail 邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.qq.com 登录邮箱\n2. 点击「设置」→「账户」\n3. 找到「POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV 服务」\n4. 开启「IMAP/SMTP 服务」（需短信验证）\n5. 点击「生成授权码」\n6. 将 16 位授权码填入本页面的「密码/授权码」栏';

  @override
  String get emailGuide163 =>
      '❌ 网易邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.163.com 登录邮箱\n2. 点击「设置」→「POP3/SMTP/IMAP」\n3. 开启「IMAP/SMTP 服务」\n4. 按提示用手机发短信验证\n5. 获得授权码后填入本页面的「密码/授权码」栏';

  @override
  String get emailGuideGmail =>
      '❌ Gmail 需要使用「应用专用密码」\n\n获取步骤：\n1. 打开 myaccount.google.com\n2. 进入「安全性」→「两步验证」（必须先开启）\n3. 在两步验证页面底部找到「应用专用密码」\n4. 选择「邮件」→ 生成密码\n5. 将 16 位密码填入本页面的「密码/授权码」栏\n\n⚠️ 如果找不到「应用专用密码」，请先确保已开启两步验证';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail 需要使用「应用密码」\n\n获取步骤：\n1. 打开 account.microsoft.com\n2. 进入「安全」→「高级安全选项」\n3. 开启「两步验证」\n4. 在「应用密码」中创建新密码\n5. 将生成的密码填入本页面';

  @override
  String get emailGuideICloud =>
      '❌ iCloud 邮箱需要使用「App 专用密码」\n\n获取步骤：\n1. 打开 appleid.apple.com 登录\n2. 进入「登录和安全」→「App 专用密码」\n3. 点击「生成 App 专用密码」\n4. 将密码填入本页面';

  @override
  String get emailGuideGeneric =>
      '登录失败，可能的原因：\n\n1. 密码不正确 — 很多邮箱不允许直接使用登录密码，需要生成「授权码」或「应用专用密码」\n2. SMTP 服务未开启 — 请登录邮箱网页版，在设置中开启 SMTP 服务\n3. 登录频率限制 — 短时间内多次尝试可能被限制，请稍后重试\n\n建议去邮箱的「设置」页面查看 SMTP 相关选项。';

  @override
  String get purchaseFeatureCheckin => '签到守护';

  @override
  String get purchaseFeatureCheckinDesc => '手动 + 自动签到、连续天数统计';

  @override
  String get purchaseFeatureAlert => '三级预警';

  @override
  String get purchaseFeatureAlertDesc => '预警 → 超时邮件 → SOS 紧急邮件';

  @override
  String get purchaseFeatureLocation => '位置共享';

  @override
  String get purchaseFeatureLocationDesc => 'GPS 定位，紧急时发送给联系人';

  @override
  String get purchaseFeatureMessage => '遗言留言';

  @override
  String get purchaseFeatureMessageDesc => '写下想说的话，紧急时随邮件发送';

  @override
  String get purchaseUnlocked => '已解锁全部功能';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return '当前名额：$current 人（上限 $max）';
  }

  @override
  String get purchaseAddContact => '增加 1 个联系人名额';

  @override
  String get noRecord => '无记录';

  @override
  String get emailUsingDefault => '使用默认邮箱发送';

  @override
  String get contactVerifyEmail => '验证邮箱';

  @override
  String get contactVerifying => '验证中...';

  @override
  String get contactVerifySuccess => '验证邮件已发送，请让联系人确认收件箱';

  @override
  String get contactVerifyFail => '发送失败，请检查邮箱地址是否正确';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => '爱你';

  @override
  String get checkinSuccess => '签到成功 ❤️';

  @override
  String get autoCheckinNotification => '今天已自动签到 ❤️';

  @override
  String streakDays(int count) {
    return '连续签到 $count 天';
  }

  @override
  String get welcomeTitle => 'LoveYou 守护你';

  @override
  String get welcomeSubtitle => '每天一个「爱你」，让关心你的人安心';

  @override
  String get setupName => '你的名字';

  @override
  String get setupNameHint => '请输入你的姓名';

  @override
  String get setupContact => '紧急联系人';

  @override
  String get setupContactName => '联系人姓名';

  @override
  String get setupContactEmail => '联系人邮箱';

  @override
  String get setupDone => '开始守护';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsCheckinMode => '签到模式';

  @override
  String get settingsManualMode => '手动签到';

  @override
  String get settingsAutoMode => '自动签到';

  @override
  String get settingsCheckinInterval => '签到间隔';

  @override
  String get settingsInterval24h => '每 24 小时';

  @override
  String get settingsInterval12h => '每 12 小时';

  @override
  String get settingsInactivityThreshold => '无活动预警时间';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours 小时';
  }

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsAccessibility => '关爱模式（适老化）';

  @override
  String get settingsLastMessage => '遗言 / 留言';

  @override
  String get settingsContacts => '紧急联系人';

  @override
  String get settingsPurchase => '解锁全部功能';

  @override
  String get contactsTitle => '紧急联系人';

  @override
  String get contactsAdd => '添加联系人';

  @override
  String contactsMax(int max) {
    return '最多 $max 人';
  }

  @override
  String get contactsExtraCost => '额外联系人 ¥1.99/人';

  @override
  String get contactsDefault => '默认（含 1 人）';

  @override
  String get messageTitle => '遗言 / 留言';

  @override
  String get messageHint => '写下你想对 TA 说的话...';

  @override
  String get messageSaved => '已保存';

  @override
  String get purchaseTitle => '解锁 LoveYou';

  @override
  String get purchaseDescription => '一次买断，终身守护';

  @override
  String get purchasePrice => '¥8.00';

  @override
  String get purchaseButton => '立即解锁';

  @override
  String get purchaseRestoreButton => '恢复购买';

  @override
  String get alertPreWarning => '嘿，你还好吗？点一下 ❤️';

  @override
  String alertInactivityHours(int hours) {
    return '已超过 $hours 小时未活动';
  }

  @override
  String get modeChangeNotice => '签到模式已切换，已通知所有紧急联系人';

  @override
  String get thresholdChangeNotice => '预警时间已更新，已通知所有紧急联系人';

  @override
  String get locationUnavailable => '位置不可用';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get edit => '编辑';

  @override
  String get done => '完成';

  @override
  String get voiceListening => '正在听...';

  @override
  String get voiceCheckin => '语音签到';

  @override
  String get checkinReminderNotification => '别忘了今天签到哦 ❤️';

  @override
  String get contactDeleteConfirm => '确定要删除此联系人吗？';

  @override
  String get messageDescription => '当预警触发时，这段话会随邮件一起发送给你的紧急联系人。';

  @override
  String get emailSetupTitle => '邮箱设置';

  @override
  String get emailSetupHeading => '配置发信邮箱';

  @override
  String get emailSetupDescription => '当你未按时签到时，App 会通过这个邮箱给紧急联系人发送提醒邮件。';

  @override
  String get emailNotConfigured => '未配置（邮件无法发送）';

  @override
  String get emailSaved => '邮箱配置已保存';

  @override
  String get emailTestSuccess => '测试邮件发送成功！请检查收件箱';

  @override
  String get emailProviderAuto => '自动检测';

  @override
  String get emailProviderQQ => 'QQ 邮箱';

  @override
  String get emailProvider163 => '网易 163';

  @override
  String get emailProviderCustom => '自定义 SMTP';

  @override
  String get emailProviderLabel => '邮箱类型';

  @override
  String get emailAddressLabel => '邮箱地址';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => '请输入邮箱';

  @override
  String get emailAddressInvalid => '邮箱格式不正确';

  @override
  String get emailPasswordLabel => '密码 / 授权码';

  @override
  String get emailPasswordHint => 'Gmail 用应用专用密码，QQ/163 用授权码';

  @override
  String get emailPasswordRequired => '请输入密码或授权码';

  @override
  String get emailSmtpHost => 'SMTP 服务器';

  @override
  String get emailSmtpHostRequired => '请输入 SMTP 服务器';

  @override
  String get emailSmtpPort => '端口';

  @override
  String get emailTipTitle => '提示';

  @override
  String get emailTipContent =>
      '• Gmail：需开启「两步验证」后生成「应用专用密码」\n• QQ 邮箱：设置 → 账户 → 生成「授权码」\n• 163 邮箱：设置 → POP3/SMTP → 开启并获取授权码\n• 密码仅存储在你的手机本地，不会上传';

  @override
  String get emailSaveButton => '保存配置';

  @override
  String get emailTestButton => '发送测试邮件';

  @override
  String get emailTesting => '发送中...';

  @override
  String get emailErrorAuthTitle => '登录验证失败';

  @override
  String get emailErrorNetworkTitle => '网络连接失败';

  @override
  String get emailErrorGenericTitle => '发送失败';

  @override
  String emailErrorGenericMsg(String error) {
    return '错误信息：$error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. 检查手机网络是否正常（Wi-Fi 或蜂窝数据）\n2. 如果使用 VPN，尝试关闭后重试\n3. 如果是自定义 SMTP，请确认服务器地址和端口是否正确\n4. 部分网络环境可能屏蔽了 465/587 端口，可尝试切换';

  @override
  String get emailErrorGenericSteps =>
      '请检查：\n1. 邮箱地址是否正确\n2. 密码/授权码是否正确\n3. 网络是否正常';

  @override
  String get emailErrorDismiss => '知道了';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail 邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.qq.com 登录邮箱\n2. 点击「设置」→「账户」\n3. 找到「POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV 服务」\n4. 开启「IMAP/SMTP 服务」（需短信验证）\n5. 点击「生成授权码」\n6. 将 16 位授权码填入本页面的「密码/授权码」栏';

  @override
  String get emailGuide163 =>
      '❌ 网易邮箱不能使用登录密码，需要使用「授权码」\n\n获取步骤：\n1. 电脑打开 mail.163.com 登录邮箱\n2. 点击「设置」→「POP3/SMTP/IMAP」\n3. 开启「IMAP/SMTP 服务」\n4. 按提示用手机发短信验证\n5. 获得授权码后填入本页面的「密码/授权码」栏';

  @override
  String get emailGuideGmail =>
      '❌ Gmail 需要使用「应用专用密码」\n\n获取步骤：\n1. 打开 myaccount.google.com\n2. 进入「安全性」→「两步验证」（必须先开启）\n3. 在两步验证页面底部找到「应用专用密码」\n4. 选择「邮件」→ 生成密码\n5. 将 16 位密码填入本页面的「密码/授权码」栏\n\n⚠️ 如果找不到「应用专用密码」，请先确保已开启两步验证';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail 需要使用「应用密码」\n\n获取步骤：\n1. 打开 account.microsoft.com\n2. 进入「安全」→「高级安全选项」\n3. 开启「两步验证」\n4. 在「应用密码」中创建新密码\n5. 将生成的密码填入本页面';

  @override
  String get emailGuideICloud =>
      '❌ iCloud 邮箱需要使用「App 专用密码」\n\n获取步骤：\n1. 打开 appleid.apple.com 登录\n2. 进入「登录和安全」→「App 专用密码」\n3. 点击「生成 App 专用密码」\n4. 将密码填入本页面';

  @override
  String get emailGuideGeneric =>
      '登录失败，可能的原因：\n\n1. 密码不正确 — 很多邮箱不允许直接使用登录密码，需要生成「授权码」或「应用专用密码」\n2. SMTP 服务未开启 — 请登录邮箱网页版，在设置中开启 SMTP 服务\n3. 登录频率限制 — 短时间内多次尝试可能被限制，请稍后重试\n\n建议去邮箱的「设置」页面查看 SMTP 相关选项。';

  @override
  String get purchaseFeatureCheckin => '签到守护';

  @override
  String get purchaseFeatureCheckinDesc => '手动 + 自动签到、连续天数统计';

  @override
  String get purchaseFeatureAlert => '三级预警';

  @override
  String get purchaseFeatureAlertDesc => '预警 → 超时邮件 → SOS 紧急邮件';

  @override
  String get purchaseFeatureLocation => '位置共享';

  @override
  String get purchaseFeatureLocationDesc => 'GPS 定位，紧急时发送给联系人';

  @override
  String get purchaseFeatureMessage => '遗言留言';

  @override
  String get purchaseFeatureMessageDesc => '写下想说的话，紧急时随邮件发送';

  @override
  String get purchaseUnlocked => '已解锁全部功能';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return '当前名额：$current 人（上限 $max）';
  }

  @override
  String get purchaseAddContact => '增加 1 个联系人名额';

  @override
  String get noRecord => '无记录';

  @override
  String get emailUsingDefault => '使用默认邮箱发送';

  @override
  String get contactVerifyEmail => '验证邮箱';

  @override
  String get contactVerifying => '验证中...';

  @override
  String get contactVerifySuccess => '验证邮件已发送，请让联系人确认收件箱';

  @override
  String get contactVerifyFail => '发送失败，请检查邮箱地址是否正确';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appName => 'LoveYou';

  @override
  String get checkinButton => '愛你';

  @override
  String get checkinSuccess => '簽到成功 ❤️';

  @override
  String get autoCheckinNotification => '今天已自動簽到 ❤️';

  @override
  String streakDays(int count) {
    return '連續簽到 $count 天';
  }

  @override
  String get welcomeTitle => 'LoveYou 守護你';

  @override
  String get welcomeSubtitle => '每天一個「愛你」，讓關心你的人安心';

  @override
  String get setupName => '你的名字';

  @override
  String get setupNameHint => '請輸入你的姓名';

  @override
  String get setupContact => '緊急聯絡人';

  @override
  String get setupContactName => '聯絡人姓名';

  @override
  String get setupContactEmail => '聯絡人信箱';

  @override
  String get setupDone => '開始守護';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsCheckinMode => '簽到模式';

  @override
  String get settingsManualMode => '手動簽到';

  @override
  String get settingsAutoMode => '自動簽到';

  @override
  String get settingsCheckinInterval => '簽到間隔';

  @override
  String get settingsInterval24h => '每 24 小時';

  @override
  String get settingsInterval12h => '每 12 小時';

  @override
  String get settingsInactivityThreshold => '無活動預警時間';

  @override
  String settingsInactivityHours(int hours) {
    return '$hours 小時';
  }

  @override
  String get settingsLanguage => '語言';

  @override
  String get settingsAccessibility => '關愛模式（適老化）';

  @override
  String get settingsLastMessage => '遺言 / 留言';

  @override
  String get settingsContacts => '緊急聯絡人';

  @override
  String get settingsPurchase => '解鎖全部功能';

  @override
  String get contactsTitle => '緊急聯絡人';

  @override
  String get contactsAdd => '新增聯絡人';

  @override
  String contactsMax(int max) {
    return '最多 $max 人';
  }

  @override
  String get contactsExtraCost => '額外聯絡人 NT\$30/人';

  @override
  String get contactsDefault => '預設（含 1 人）';

  @override
  String get messageTitle => '遺言 / 留言';

  @override
  String get messageHint => '寫下你想對 TA 說的話...';

  @override
  String get messageSaved => '已儲存';

  @override
  String get purchaseTitle => '解鎖 LoveYou';

  @override
  String get purchaseDescription => '一次買斷，終身守護';

  @override
  String get purchasePrice => 'NT\$30';

  @override
  String get purchaseButton => '立即解鎖';

  @override
  String get purchaseRestoreButton => '恢復購買';

  @override
  String get alertPreWarning => '嘿，你還好嗎？點一下 ❤️';

  @override
  String alertInactivityHours(int hours) {
    return '已超過 $hours 小時未活動';
  }

  @override
  String get modeChangeNotice => '簽到模式已切換，已通知所有緊急聯絡人';

  @override
  String get thresholdChangeNotice => '預警時間已更新，已通知所有緊急聯絡人';

  @override
  String get locationUnavailable => '位置不可用';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '確認';

  @override
  String get save => '儲存';

  @override
  String get delete => '刪除';

  @override
  String get edit => '編輯';

  @override
  String get done => '完成';

  @override
  String get voiceListening => '正在聽...';

  @override
  String get voiceCheckin => '語音簽到';

  @override
  String get checkinReminderNotification => '別忘了今天簽到哦 ❤️';

  @override
  String get contactDeleteConfirm => '確定要刪除此聯絡人嗎？';

  @override
  String get messageDescription => '當預警觸發時，這段話會隨郵件一起發送給你的緊急聯絡人。';

  @override
  String get emailSetupTitle => '郵箱設定';

  @override
  String get emailSetupHeading => '配置發信郵箱';

  @override
  String get emailSetupDescription => '當你未按時簽到時，App 會通過這個郵箱給緊急聯絡人發送提醒郵件。';

  @override
  String get emailNotConfigured => '未配置（郵件無法發送）';

  @override
  String get emailSaved => '郵箱配置已儲存';

  @override
  String get emailTestSuccess => '測試郵件發送成功！請檢查收件匣';

  @override
  String get emailProviderAuto => '自動偵測';

  @override
  String get emailProviderQQ => 'QQ 郵箱';

  @override
  String get emailProvider163 => '網易 163';

  @override
  String get emailProviderCustom => '自訂 SMTP';

  @override
  String get emailProviderLabel => '郵箱類型';

  @override
  String get emailAddressLabel => '郵箱地址';

  @override
  String get emailAddressHint => 'you@example.com';

  @override
  String get emailAddressRequired => '請輸入郵箱';

  @override
  String get emailAddressInvalid => '郵箱格式不正確';

  @override
  String get emailPasswordLabel => '密碼 / 授權碼';

  @override
  String get emailPasswordHint => 'Gmail 用應用專用密碼，QQ/163 用授權碼';

  @override
  String get emailPasswordRequired => '請輸入密碼或授權碼';

  @override
  String get emailSmtpHost => 'SMTP 伺服器';

  @override
  String get emailSmtpHostRequired => '請輸入 SMTP 伺服器';

  @override
  String get emailSmtpPort => '連接埠';

  @override
  String get emailTipTitle => '提示';

  @override
  String get emailTipContent =>
      '• Gmail：需開啟「兩步驗證」後生成「應用專用密碼」\n• QQ 郵箱：設定 → 帳戶 → 生成「授權碼」\n• 163 郵箱：設定 → POP3/SMTP → 開啟並取得授權碼\n• 密碼僅儲存在你的手機本機，不會上傳';

  @override
  String get emailSaveButton => '儲存配置';

  @override
  String get emailTestButton => '發送測試郵件';

  @override
  String get emailTesting => '發送中...';

  @override
  String get emailErrorAuthTitle => '登入驗證失敗';

  @override
  String get emailErrorNetworkTitle => '網路連線失敗';

  @override
  String get emailErrorGenericTitle => '發送失敗';

  @override
  String emailErrorGenericMsg(String error) {
    return '錯誤訊息：$error';
  }

  @override
  String get emailErrorNetworkSteps =>
      '1. 檢查手機網路是否正常（Wi-Fi 或行動數據）\n2. 如果使用 VPN，嘗試關閉後重試\n3. 如果是自訂 SMTP，請確認伺服器地址和連接埠是否正確\n4. 部分網路環境可能封鎖了 465/587 連接埠，可嘗試切換';

  @override
  String get emailErrorGenericSteps =>
      '請檢查：\n1. 郵箱地址是否正確\n2. 密碼/授權碼是否正確\n3. 網路是否正常';

  @override
  String get emailErrorDismiss => '知道了';

  @override
  String get emailGuideQQ =>
      '❌ QQ/Foxmail 郵箱不能使用登入密碼，需要使用「授權碼」\n\n取得步驟：\n1. 電腦打開 mail.qq.com 登入郵箱\n2. 點選「設定」→「帳戶」\n3. 找到「POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV 服務」\n4. 開啟「IMAP/SMTP 服務」（需簡訊驗證）\n5. 點選「生成授權碼」\n6. 將 16 位授權碼填入本頁面的「密碼/授權碼」欄';

  @override
  String get emailGuide163 =>
      '❌ 網易郵箱不能使用登入密碼，需要使用「授權碼」\n\n取得步驟：\n1. 電腦打開 mail.163.com 登入郵箱\n2. 點選「設定」→「POP3/SMTP/IMAP」\n3. 開啟「IMAP/SMTP 服務」\n4. 按提示用手機發簡訊驗證\n5. 取得授權碼後填入本頁面的「密碼/授權碼」欄';

  @override
  String get emailGuideGmail =>
      '❌ Gmail 需要使用「應用專用密碼」\n\n取得步驟：\n1. 打開 myaccount.google.com\n2. 進入「安全性」→「兩步驗證」（必須先開啟）\n3. 在兩步驗證頁面底部找到「應用專用密碼」\n4. 選擇「郵件」→ 產生密碼\n5. 將 16 位密碼填入本頁面的「密碼/授權碼」欄\n\n⚠️ 如果找不到「應用專用密碼」，請先確保已開啟兩步驗證';

  @override
  String get emailGuideOutlook =>
      '❌ Outlook/Hotmail 需要使用「應用密碼」\n\n取得步驟：\n1. 打開 account.microsoft.com\n2. 進入「安全」→「進階安全選項」\n3. 開啟「兩步驗證」\n4. 在「應用密碼」中建立新密碼\n5. 將產生的密碼填入本頁面';

  @override
  String get emailGuideICloud =>
      '❌ iCloud 郵箱需要使用「App 專用密碼」\n\n取得步驟：\n1. 打開 appleid.apple.com 登入\n2. 進入「登入和安全」→「App 專用密碼」\n3. 點選「產生 App 專用密碼」\n4. 將密碼填入本頁面';

  @override
  String get emailGuideGeneric =>
      '登入失敗，可能的原因：\n\n1. 密碼不正確 — 很多郵箱不允許直接使用登入密碼，需要產生「授權碼」或「應用專用密碼」\n2. SMTP 服務未開啟 — 請登入郵箱網頁版，在設定中開啟 SMTP 服務\n3. 登入頻率限制 — 短時間內多次嘗試可能被限制，請稍後重試\n\n建議去郵箱的「設定」頁面查看 SMTP 相關選項。';

  @override
  String get purchaseFeatureCheckin => '簽到守護';

  @override
  String get purchaseFeatureCheckinDesc => '手動 + 自動簽到、連續天數統計';

  @override
  String get purchaseFeatureAlert => '三級預警';

  @override
  String get purchaseFeatureAlertDesc => '預警 → 逾時郵件 → SOS 緊急郵件';

  @override
  String get purchaseFeatureLocation => '位置分享';

  @override
  String get purchaseFeatureLocationDesc => 'GPS 定位，緊急時發送給聯絡人';

  @override
  String get purchaseFeatureMessage => '遺言留言';

  @override
  String get purchaseFeatureMessageDesc => '寫下想說的話，緊急時隨郵件發送';

  @override
  String get purchaseUnlocked => '已解鎖全部功能';

  @override
  String purchaseCurrentSlots(int current, int max) {
    return '目前名額：$current 人（上限 $max）';
  }

  @override
  String get purchaseAddContact => '增加 1 個聯絡人名額';

  @override
  String get noRecord => '無紀錄';

  @override
  String get emailUsingDefault => '使用預設信箱發送';

  @override
  String get contactVerifyEmail => '驗證信箱';

  @override
  String get contactVerifying => '驗證中...';

  @override
  String get contactVerifySuccess => '驗證郵件已發送，請讓聯絡人確認收件匣';

  @override
  String get contactVerifyFail => '發送失敗，請檢查信箱地址是否正確';
}
