import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFFE91E63);
  static const Color primaryDark = Color(0xFFC2185B);
  static const Color accentColor = Color(0xFFFF5252);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color dangerColor = Color(0xFFF44336);
  static const Color bgLight = Color(0xFFFFF8F9);
  static const Color bgDark = Color(0xFF121212);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  static ThemeData light({bool accessibility = false}) {
    final double fontScale = accessibility ? 1.5 : 1.0;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: bgLight,
      textTheme: _buildTextTheme(fontScale, Brightness.light),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, accessibility ? 72 : 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            fontSize: (accessibility ? 24 : 18) * 1.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: (accessibility ? 28 : 20) * 1.0,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: textPrimary,
          size: accessibility ? 32 : 24,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
      ),
    );
  }

  static ThemeData dark({bool accessibility = false}) {
    final double fontScale = accessibility ? 1.5 : 1.0;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: bgDark,
      textTheme: _buildTextTheme(fontScale, Brightness.dark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, accessibility ? 72 : 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            fontSize: (accessibility ? 24 : 18) * 1.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: (accessibility ? 28 : 20) * 1.0,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: accessibility ? 32 : 24,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: const Color(0xFF1E1E1E),
      ),
    );
  }

  static TextTheme _buildTextTheme(double scale, Brightness brightness) {
    final Color color =
        brightness == Brightness.light ? textPrimary : Colors.white;
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 32 * scale, fontWeight: FontWeight.bold, color: color),
      headlineMedium: TextStyle(
          fontSize: 24 * scale, fontWeight: FontWeight.w600, color: color),
      titleLarge: TextStyle(
          fontSize: 20 * scale, fontWeight: FontWeight.w600, color: color),
      bodyLarge: TextStyle(fontSize: 16 * scale, color: color),
      bodyMedium: TextStyle(fontSize: 14 * scale, color: color),
      labelLarge: TextStyle(
          fontSize: 16 * scale, fontWeight: FontWeight.w600, color: color),
    );
  }
}
