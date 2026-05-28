import 'package:flutter/material.dart';
import 'package:love_you/l10n/generated/app_localizations.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/emergency_contact.dart';
import '../../core/services/alert_email_service.dart';
import '../../core/storage/storage_service.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _storage = StorageService();

  List<EmergencyContact> get _contacts => _storage.contacts;

  int get _maxAllowed {
    final profile = _storage.profile;
    return profile?.maxContacts ?? AppConstants.defaultContactSlots;
  }

  bool get _canAddFree => _contacts.length < _maxAllowed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.contactsTitle),
        actions: [
          if (_contacts.length < AppConstants.maxContacts)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showAddDialog(context),
            ),
        ],
      ),
      body: _contacts.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.people_outline,
                      size: 64, color: theme.colorScheme.primary.withOpacity(0.4)),
                  const SizedBox(height: 16),
                  Text(l10n.contactsAdd,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.textTheme.bodyLarge?.color?.withOpacity(0.5),
                      )),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _contacts.length + 1,
              itemBuilder: (ctx, i) {
                if (i == _contacts.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '${_contacts.length} / ${AppConstants.maxContacts}  ·  ${l10n.contactsExtraCost}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                final contact = _contacts[i];
                return Dismissible(
                  key: ValueKey('${contact.name}_${contact.email}_$i'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 24),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) => _confirmDelete(context),
                  onDismissed: (_) async {
                    await _storage.deleteContact(i);
                    setState(() {});
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
                        style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                      ),
                    ),
                    title: Text(contact.name),
                    subtitle: Text(contact.email),
                    trailing: i == 0
                        ? Chip(
                            label: Text(l10n.contactsDefault,
                                style: const TextStyle(fontSize: 11)),
                            visualDensity: VisualDensity.compact,
                          )
                        : null,
                    onTap: () => _showEditDialog(context, i, contact),
                  ),
                );
              },
            ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.delete),
            content: Text(l10n.contactDeleteConfirm),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text(l10n.delete),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _showAddDialog(BuildContext context) {
    if (!_canAddFree) {
      // TODO: Trigger IAP for extra contact slot
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.contactsExtraCost)),
      );
      return;
    }
    _showContactForm(context, null, null);
  }

  void _showEditDialog(BuildContext context, int index, EmergencyContact contact) {
    _showContactForm(context, index, contact);
  }

  void _showContactForm(BuildContext context, int? index, EmergencyContact? existing) {
    final l10n = AppLocalizations.of(context)!;
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final emailCtrl = TextEditingController(text: existing?.email ?? '');
    final formKey = GlobalKey<FormState>();
    bool verifying = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  index == null ? l10n.contactsAdd : l10n.edit,
                  style: Theme.of(ctx).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: l10n.setupContactName,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty) ? l10n.setupContactName : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: l10n.setupContactEmail,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return l10n.setupContactEmail;
                    if (!v.contains('@')) return l10n.setupContactEmail;
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: verifying
                      ? null
                      : () async {
                          final email = emailCtrl.text.trim();
                          if (email.isEmpty || !email.contains('@')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.setupContactEmail)),
                            );
                            return;
                          }
                          setSheetState(() => verifying = true);
                          final error =
                              await AlertEmailService().sendVerifyEmail(email);
                          if (!ctx.mounted) return;
                          setSheetState(() => verifying = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error == null
                                  ? l10n.contactVerifySuccess
                                  : l10n.contactVerifyFail),
                              backgroundColor:
                                  error == null ? Colors.green : Colors.red,
                            ),
                          );
                        },
                  icon: verifying
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.mark_email_read_outlined),
                  label: Text(
                      verifying ? l10n.contactVerifying : l10n.contactVerifyEmail),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    final contact = EmergencyContact(
                      name: nameCtrl.text.trim(),
                      email: emailCtrl.text.trim(),
                    );
                    if (index != null) {
                      await _storage.updateContact(index, contact);
                    } else {
                      await _storage.addContact(contact);
                    }
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  child: Text(l10n.save),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
