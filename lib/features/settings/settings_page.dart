import 'package:flutter/material.dart';
import 'package:love_you/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../app/app_state.dart';
import '../contacts/contacts_page.dart';
import '../message/message_page.dart';
import '../payment/purchase_page.dart';
import 'language_page.dart';
import 'email_setup_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = context.watch<AppState>();
    final profile = state.profile;

    if (profile == null) return const SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _SectionHeader(l10n.settingsCheckinMode),
          SwitchListTile(
            title: Text(l10n.settingsAutoMode),
            subtitle: Text(
              profile.isAutoCheckin
                  ? l10n.settingsAutoMode
                  : l10n.settingsManualMode,
            ),
            value: profile.isAutoCheckin,
            onChanged: (v) {
              state.updateCheckinMode(v);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.modeChangeNotice)),
              );
            },
          ),
          const Divider(),
          _SectionHeader(l10n.settingsCheckinInterval),
          RadioListTile<int>(
            title: Text(l10n.settingsInterval24h),
            value: 24,
            groupValue: profile.checkinIntervalHours,
            onChanged: (v) => state.updateCheckinInterval(v!),
          ),
          RadioListTile<int>(
            title: Text(l10n.settingsInterval12h),
            value: 12,
            groupValue: profile.checkinIntervalHours,
            onChanged: (v) => state.updateCheckinInterval(v!),
          ),
          const Divider(),
          _SectionHeader(l10n.settingsInactivityThreshold),
          ListTile(
            title: Text(
              l10n.settingsInactivityHours(profile.inactivityThresholdHours),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showInactivityPicker(context, state, profile.inactivityThresholdHours),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Text(l10n.emailSetupTitle),
            subtitle: Text(
              profile.hasSmtpConfig ? profile.smtpEmail! : l10n.emailUsingDefault,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EmailSetupPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: Text(l10n.settingsContacts),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ContactsPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: Text(l10n.settingsLastMessage),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MessagePage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.settingsLanguage),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LanguagePage()),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.accessibility_new),
            title: Text(l10n.settingsAccessibility),
            value: profile.isAccessibilityMode,
            onChanged: (_) => state.toggleAccessibility(),
          ),
          const Divider(),
          if (!state.isPurchased)
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: Text(l10n.settingsPurchase),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PurchasePage()),
              ),
            ),
        ],
      ),
    );
  }

  void _showInactivityPicker(
      BuildContext context, AppState state, int current) {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int h in [4, 6, 8, 10, 12, 16, 24, 48])
                ListTile(
                  title: Text(l10n.settingsInactivityHours(h)),
                  trailing: h == current ? const Icon(Icons.check) : null,
                  onTap: () {
                    state.updateInactivityThreshold(h);
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.thresholdChangeNotice)),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
