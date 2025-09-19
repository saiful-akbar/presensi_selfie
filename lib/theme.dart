import 'package:flutter/material.dart';

class AppTheme {
  static final Color _primaryColor = Color.fromRGBO(65, 96, 136, 1);
  static final Color _secondaryColor = Color.fromRGBO(17, 149, 148, 1);
  static final Color _tertiaryColor = Color.fromRGBO(255, 203, 72, 1);
  static final Color _errorColor = Color.fromRGBO(254, 66, 62, 1);
  static final Color _textPrimaryColor = Color.fromRGBO(0, 0, 0, 1);
  static final Color _textSecondaryColor = Colors.grey.shade600;
  static final Color _backgroundColor = Colors.grey.shade100;
  static final double _borderRadius = 12;

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: _backgroundColor),
      primaryColor: _primaryColor,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        tertiary: _tertiaryColor,
        error: _errorColor,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onError: Colors.white,
        onSurface: _textPrimaryColor,
        onSurfaceVariant: _textSecondaryColor,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textPrimaryColor),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _textPrimaryColor),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _textPrimaryColor),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: _textSecondaryColor),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: _textSecondaryColor,
        ),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: _textSecondaryColor),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(color: _primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(color: _errorColor, width: 2),
        ),
        hintStyle: TextStyle(
          // color: _textSecondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TextStyle(color: _textSecondaryColor, fontWeight: FontWeight.w500),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return TextStyle(
              color: _errorColor, // warna saat error
              fontWeight: FontWeight.w600,
            );
          }
          if (states.contains(WidgetState.focused)) {
            return TextStyle(
              color: _primaryColor, // warna saat fokus
              fontWeight: FontWeight.w600,
            );
          }
          return TextStyle(
            color: _textSecondaryColor, // default
            fontWeight: FontWeight.w500,
          );
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
        margin: EdgeInsets.all(0),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      ),
    );
  }
}
