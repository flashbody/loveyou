import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../app/app_state.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  static const _languages = [
    _Lang('zh_CN', '简体中文', '🇨🇳'),
    _Lang('zh_TW', '繁體中文', '🇭🇰'),
    _Lang('en', 'English', '🇺🇸'),
    _Lang('es', 'Español', '🇪🇸'),
    _Lang('fr', 'Français', '🇫🇷'),
    _Lang('de', 'Deutsch', '🇩🇪'),
    _Lang('pt', 'Português', '🇧🇷'),
    _Lang('it', 'Italiano', '🇮🇹'),
    _Lang('ja', '日本語', '🇯🇵'),
    _Lang('ko', '한국어', '🇰🇷'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = context.watch<AppState>();
    final resolved = state.locale ?? Localizations.localeOf(context);
    final currentCode = resolved.toLanguageTag().replaceAll('-', '_');

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsLanguage)),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final lang = _languages[index];
          final isSelected = currentCode == lang.code ||
              (!lang.code.contains('_') && currentCode.startsWith(lang.code));

          return ListTile(
            leading: Text(lang.flag, style: const TextStyle(fontSize: 28)),
            title: Text(lang.name),
            subtitle: Text(lang.code),
            trailing: isSelected
                ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                : null,
            onTap: () {
              final parts = lang.code.split('_');
              final locale = parts.length > 1
                  ? Locale(parts[0], parts[1])
                  : Locale(parts[0]);
              state.setLocale(locale);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class _Lang {
  final String code;
  final String name;
  final String flag;
  const _Lang(this.code, this.name, this.flag);
}
