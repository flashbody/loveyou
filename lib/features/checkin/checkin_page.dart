import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../app/app_state.dart';
import '../../core/models/checkin_record.dart';
import '../../core/storage/storage_service.dart';
import '../../core/services/activity_service.dart';
import '../../core/services/voice_checkin_service.dart';
import '../payment/purchase_page.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnim;
  bool _justCheckedIn = false;
  bool _isVoiceListening = false;
  String _voiceText = '';

  final _voiceService = VoiceCheckinService();

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    _voiceService.dispose();
    super.dispose();
  }

  Future<void> _onCheckin() async {
    HapticFeedback.heavyImpact();
    await _animController.forward();
    await _animController.reverse();

    final storage = StorageService();
    await storage.addCheckin(CheckinRecord(isAutomatic: false));
    ActivityService().onManualCheckin();

    if (!mounted) return;

    setState(() => _justCheckedIn = true);
    context.read<AppState>().refresh();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _justCheckedIn = false);
    });
  }

  Future<void> _onVoiceCheckin() async {
    if (_isVoiceListening) {
      _voiceService.stopListening();
      setState(() {
        _isVoiceListening = false;
        _voiceText = '';
      });
      return;
    }

    setState(() {
      _isVoiceListening = true;
      _voiceText = '';
    });

    final locale = Localizations.localeOf(context).toLanguageTag();

    await _voiceService.startListening(
      languageCode: locale,
      onCheckinDetected: () {
        setState(() => _isVoiceListening = false);
        _onCheckin();
      },
      onPartialResult: (text) {
        if (mounted) setState(() => _voiceText = text);
      },
    );

    await Future.delayed(const Duration(seconds: 11));
    if (mounted && _isVoiceListening) {
      setState(() {
        _isVoiceListening = false;
        _voiceText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final state = context.watch<AppState>();
    final streak = state.streakDays;
    final isAccessibility = state.isAccessibilityMode;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              l10n.streakDays(streak),
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Center(child: ScaleTransition(
              scale: _scaleAnim,
              child: GestureDetector(
                onTap: _onCheckin,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isAccessibility ? 260 : 200,
                  height: isAccessibility ? 260 : 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _justCheckedIn
                        ? const LinearGradient(
                            colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Color(0xFFFF5252), Color(0xFFE91E63)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: (_justCheckedIn
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFFE91E63))
                            .withOpacity(0.4),
                        blurRadius: 40,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _justCheckedIn
                          ? l10n.checkinSuccess
                          : l10n.checkinButton,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isAccessibility ? 36 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 24),

            // Voice check-in (accessibility mode only)
            if (isAccessibility) ...[
              if (_voiceText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    _voiceText,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _onVoiceCheckin,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isVoiceListening
                        ? theme.colorScheme.error
                        : theme.colorScheme.secondaryContainer,
                  ),
                  child: Icon(
                    _isVoiceListening ? Icons.mic : Icons.mic_none,
                    size: 32,
                    color: _isVoiceListening
                        ? Colors.white
                        : theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _isVoiceListening ? l10n.voiceListening : l10n.voiceCheckin,
                style: theme.textTheme.bodyMedium,
              ),
            ],

            const Spacer(),
            if (!state.isPurchased)
              Padding(
                padding: const EdgeInsets.all(24),
                child: OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PurchasePage()),
                  ),
                  child: Text(l10n.settingsPurchase),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ));
  }
}
