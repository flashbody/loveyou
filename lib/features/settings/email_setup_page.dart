import 'package:flutter/material.dart';
import 'package:love_you/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../app/app_state.dart';
import '../../core/services/alert_email_service.dart';
import '../../core/storage/storage_service.dart';

class EmailSetupPage extends StatefulWidget {
  const EmailSetupPage({super.key});

  @override
  State<EmailSetupPage> createState() => _EmailSetupPageState();
}

class _EmailSetupPageState extends State<EmailSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _hostController = TextEditingController();
  final _portController = TextEditingController();
  bool _useSsl = true;
  bool _testing = false;
  bool _obscurePassword = true;
  String _selectedProvider = 'auto';

  Map<String, String> _providerLabels(AppLocalizations l10n) => {
    'auto': l10n.emailProviderAuto,
    'gmail': 'Gmail',
    'qq': l10n.emailProviderQQ,
    '163': l10n.emailProvider163,
    'outlook': 'Outlook / Hotmail',
    'icloud': 'iCloud',
    'custom': l10n.emailProviderCustom,
  };

  @override
  void initState() {
    super.initState();
    final profile = StorageService().profile;
    if (profile != null) {
      _emailController.text = profile.smtpEmail ?? '';
      _passwordController.text = profile.smtpPassword ?? '';
      _hostController.text = profile.smtpHost ?? '';
      _portController.text = profile.smtpPort.toString();
      _useSsl = profile.smtpUseSsl;

      if (profile.smtpHost != null && profile.smtpHost!.isNotEmpty) {
        _selectedProvider = 'custom';
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final storage = StorageService();
    final profile = storage.profile;
    if (profile == null) return;

    profile.smtpEmail = _emailController.text.trim();
    profile.smtpPassword = _passwordController.text;
    profile.smtpHost = _selectedProvider == 'custom'
        ? _hostController.text.trim()
        : null;
    profile.smtpPort = int.tryParse(_portController.text) ?? 465;
    profile.smtpUseSsl = _useSsl;
    await storage.saveProfile(profile);

    if (mounted) {
      final l10n = AppLocalizations.of(context)!;
      context.read<AppState>().refresh();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.emailSaved)),
      );
    }
  }

  Future<void> _testSend() async {
    if (!_formKey.currentState!.validate()) return;

    await _save();

    setState(() => _testing = true);
    final error = await AlertEmailService().sendTestEmail();
    if (!mounted) return;
    setState(() => _testing = false);

    if (error == null) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.emailTestSuccess),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      _showErrorGuide(error);
    }
  }

  void _showErrorGuide(String error) {
    final l10n = AppLocalizations.of(context)!;
    final email = _emailController.text.trim().toLowerCase();
    final domain = email.contains('@') ? email.split('@').last : '';

    String title;
    String content;

    if (error == 'AUTH_FAIL') {
      title = l10n.emailErrorAuthTitle;
      content = _getAuthFixGuide(l10n, domain);
    } else if (error == 'NETWORK_FAIL') {
      title = l10n.emailErrorNetworkTitle;
      content = l10n.emailErrorNetworkSteps;
    } else {
      title = l10n.emailErrorGenericTitle;
      content = '${l10n.emailErrorGenericMsg(error)}\n\n${l10n.emailErrorGenericSteps}';
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(child: Text(title)),
          ],
        ),
        content: SingleChildScrollView(
          child: Text(content, style: const TextStyle(fontSize: 14, height: 1.5)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.emailErrorDismiss),
          ),
        ],
      ),
    );
  }

  String _getAuthFixGuide(AppLocalizations l10n, String domain) {
    switch (domain) {
      case 'qq.com':
      case 'foxmail.com':
        return l10n.emailGuideQQ;
      case '163.com':
      case '126.com':
        return l10n.emailGuide163;
      case 'gmail.com':
        return l10n.emailGuideGmail;
      case 'outlook.com':
      case 'hotmail.com':
        return l10n.emailGuideOutlook;
      case 'icloud.com':
        return l10n.emailGuideICloud;
      default:
        return l10n.emailGuideGeneric;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final providers = _providerLabels(l10n);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.emailSetupTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.email_outlined, size: 48, color: theme.colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                l10n.emailSetupHeading,
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.emailSetupDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              DropdownButtonFormField<String>(
                value: _selectedProvider,
                decoration: InputDecoration(
                  labelText: l10n.emailProviderLabel,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.dns_outlined),
                ),
                items: providers.entries
                    .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedProvider = v ?? 'auto'),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.emailAddressLabel,
                  hintText: l10n.emailAddressHint,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return l10n.emailAddressRequired;
                  if (!v.contains('@')) return l10n.emailAddressInvalid;
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: l10n.emailPasswordLabel,
                  hintText: l10n.emailPasswordHint,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? l10n.emailPasswordRequired : null,
              ),

              if (_selectedProvider == 'custom') ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _hostController,
                  decoration: InputDecoration(
                    labelText: l10n.emailSmtpHost,
                    hintText: 'smtp.example.com',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.computer),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? l10n.emailSmtpHostRequired : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _portController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: l10n.emailSmtpPort,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FilterChip(
                      label: const Text('SSL'),
                      selected: _useSsl,
                      onSelected: (v) => setState(() => _useSsl = v),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 12),
              Card(
                color: theme.colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.emailTipTitle, style: theme.textTheme.labelLarge),
                      const SizedBox(height: 4),
                      Text(
                        l10n.emailTipContent,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _testing ? null : _save,
                child: Text(l10n.emailSaveButton),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _testing ? null : _testSend,
                icon: _testing
                    ? const SizedBox(width: 16, height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.send),
                label: Text(_testing ? l10n.emailTesting : l10n.emailTestButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
