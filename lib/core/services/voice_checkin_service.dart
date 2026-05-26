import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceCheckinService {
  static final VoiceCheckinService _instance = VoiceCheckinService._internal();
  factory VoiceCheckinService() => _instance;
  VoiceCheckinService._internal();

  final SpeechToText _speech = SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;

  bool get isListening => _isListening;

  static const Map<String, List<String>> _keywords = {
    'zh': ['爱你', '我爱你', '签到'],
    'en': ['love you', 'i love you', 'check in'],
    'ja': ['愛してる', 'あいしてる', 'サインイン'],
    'ko': ['사랑해', '체크인'],
    'es': ['te quiero', 'te amo'],
    'fr': ['je t\'aime', 'je taime'],
    'de': ['ich liebe dich'],
    'pt': ['te amo', 'eu te amo'],
    'it': ['ti amo'],
  };

  Future<bool> init() async {
    if (_isInitialized) return true;
    _isInitialized = await _speech.initialize(
      onError: (e) => debugPrint('[VoiceCheckin] Error: ${e.errorMsg}'),
    );
    return _isInitialized;
  }

  Future<void> startListening({
    required String languageCode,
    required void Function() onCheckinDetected,
    void Function(String text)? onPartialResult,
  }) async {
    if (_isListening) return;
    if (!_isInitialized) {
      final ok = await init();
      if (!ok) return;
    }

    _isListening = true;

    final lang = _resolveLocaleId(languageCode);
    final keywords = _getKeywords(languageCode);

    await _speech.listen(
      listenOptions: SpeechListenOptions(
        localeId: lang,
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 3),
      ),
      onResult: (result) {
        final text = result.recognizedWords.toLowerCase();
        onPartialResult?.call(text);

        if (result.finalResult) {
          _isListening = false;
          if (_matchesKeyword(text, keywords)) {
            onCheckinDetected();
          }
        }
      },
    );
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
  }

  bool _matchesKeyword(String text, List<String> keywords) {
    for (final kw in keywords) {
      if (text.contains(kw.toLowerCase())) return true;
    }
    return false;
  }

  List<String> _getKeywords(String languageCode) {
    final base = languageCode.split('_').first.split('-').first;
    return _keywords[base] ?? _keywords['en']!;
  }

  String _resolveLocaleId(String languageCode) {
    final base = languageCode.split('_').first.split('-').first;
    const mapping = {
      'zh': 'zh_CN',
      'en': 'en_US',
      'ja': 'ja_JP',
      'ko': 'ko_KR',
      'es': 'es_ES',
      'fr': 'fr_FR',
      'de': 'de_DE',
      'pt': 'pt_BR',
      'it': 'it_IT',
    };
    return mapping[base] ?? 'en_US';
  }

  void dispose() {
    _speech.cancel();
    _isListening = false;
  }
}
