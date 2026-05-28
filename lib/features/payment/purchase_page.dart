import 'dart:async';
import 'package:flutter/material.dart';
import 'package:love_you/l10n/generated/app_localizations.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import '../../app/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/background_service.dart';
import '../../core/services/location_service.dart';
import '../../core/services/activity_service.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  bool _loading = true;
  bool _purchasing = false;

  @override
  void initState() {
    super.initState();
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdated,
      onDone: () => _subscription.cancel(),
      onError: (e) {
        debugPrint('[IAP] Stream error: $e');
        if (mounted) setState(() => _purchasing = false);
      },
    );
    _loadProducts();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    final available = await _iap.isAvailable();
    if (!available) {
      setState(() => _loading = false);
      return;
    }

    final response = await _iap.queryProductDetails({
      AppConstants.iapUnlockProductId,
      AppConstants.iapExtraContactProductId,
    });

    setState(() {
      _products = response.productDetails;
      _loading = false;
    });
  }

  void _onPurchaseUpdated(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          _deliverProduct(purchase);
          break;
        case PurchaseStatus.error:
          debugPrint('[IAP] Purchase error: ${purchase.error?.message}');
          setState(() => _purchasing = false);
          break;
        case PurchaseStatus.canceled:
          setState(() => _purchasing = false);
          break;
        case PurchaseStatus.pending:
          break;
      }

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  void _deliverProduct(PurchaseDetails purchase) {
    final state = context.read<AppState>();

    if (purchase.productID == AppConstants.iapUnlockProductId) {
      state.setPurchased();
      _activateServices();
    } else if (purchase.productID == AppConstants.iapExtraContactProductId) {
      state.addExtraContactSlot();
    }

    setState(() => _purchasing = false);
  }

  Future<void> _buyUnlock() async {
    final product = _products.where(
      (p) => p.id == AppConstants.iapUnlockProductId,
    ).firstOrNull;

    if (product == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product not available')),
        );
      }
      return;
    }

    setState(() => _purchasing = true);
    try {
      final param = PurchaseParam(productDetails: product);
      await _iap.buyNonConsumable(purchaseParam: param);
    } catch (e) {
      debugPrint('[IAP] buyUnlock error: $e');
      if (mounted) setState(() => _purchasing = false);
    }
  }

  Future<void> _buyExtraContact() async {
    final product = _products.where(
      (p) => p.id == AppConstants.iapExtraContactProductId,
    ).firstOrNull;

    if (product == null) return;

    setState(() => _purchasing = true);
    try {
      final param = PurchaseParam(productDetails: product);
      await _iap.buyConsumable(purchaseParam: param);
    } catch (e) {
      debugPrint('[IAP] buyExtraContact error: $e');
      if (mounted) setState(() => _purchasing = false);
    }
  }

  Future<void> _restore() async {
    try {
      await _iap.restorePurchases();
    } catch (e) {
      debugPrint('[IAP] restore error: $e');
    }
  }

  Future<void> _activateServices() async {
    try {
      await BackgroundService.registerPeriodicTasks();
      try {
        await LocationService().startPeriodicCaching();
      } catch (_) {}
      ActivityService().startMonitoring();
      debugPrint('[PurchasePage] Services activated after purchase');
    } catch (e) {
      debugPrint('[PurchasePage] Service activation error: $e');
    }
  }

  String? get _unlockPrice {
    final product = _products.where(
      (p) => p.id == AppConstants.iapUnlockProductId,
    ).firstOrNull;
    return product?.price;
  }

  String? get _extraContactPrice {
    final product = _products.where(
      (p) => p.id == AppConstants.iapExtraContactProductId,
    ).firstOrNull;
    return product?.price;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final state = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.purchaseTitle)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.favorite, size: 80, color: theme.colorScheme.primary),
                  const SizedBox(height: 24),
                  Text(
                    l10n.purchaseTitle,
                    style: theme.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.purchaseDescription,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.textTheme.bodyLarge?.color?.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  if (!state.isPurchased) ...[
                    _FeatureCard(
                      icon: Icons.check_circle,
                      title: l10n.purchaseFeatureCheckin,
                      subtitle: l10n.purchaseFeatureCheckinDesc,
                    ),
                    _FeatureCard(
                      icon: Icons.notifications_active,
                      title: l10n.purchaseFeatureAlert,
                      subtitle: l10n.purchaseFeatureAlertDesc,
                    ),
                    _FeatureCard(
                      icon: Icons.location_on,
                      title: l10n.purchaseFeatureLocation,
                      subtitle: l10n.purchaseFeatureLocationDesc,
                    ),
                    _FeatureCard(
                      icon: Icons.message,
                      title: l10n.purchaseFeatureMessage,
                      subtitle: l10n.purchaseFeatureMessageDesc,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _purchasing ? null : _buyUnlock,
                      child: _purchasing
                          ? const SizedBox(
                              width: 20, height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : Text(l10n.purchaseButton(_unlockPrice ?? '--')),
                    ),
                  ] else ...[
                    Card(
                      color: theme.colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(Icons.verified, color: theme.colorScheme.primary),
                            const SizedBox(width: 12),
                            Text(l10n.purchaseUnlocked, style: theme.textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(l10n.contactsExtraCost(_extraContactPrice ?? '--'), style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(
                      l10n.purchaseCurrentSlots(state.profile?.maxContacts ?? 1, AppConstants.maxContacts),
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: (state.profile?.maxContacts ?? 1) >= AppConstants.maxContacts || _purchasing
                          ? null
                          : _buyExtraContact,
                      icon: const Icon(Icons.person_add),
                      label: Text(l10n.purchaseAddContact),
                    ),
                  ],

                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: _restore,
                    child: Text(l10n.purchaseRestoreButton),
                  ),
                ],
              ),
            ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
