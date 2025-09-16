import 'package:flutter/material.dart';

class AppTheme {
  static final _primaryColor = const Color.fromARGB(255, 82, 120, 171);
  static final _secondaryColor = const Color.fromRGBO(17, 149, 148, 1);
  static final _tertiaryColor = const Color.fromRGBO(255, 203, 72, 1);
  static final _errorColor = const Color.fromRGBO(254, 66, 62, 1);
  static final _textPrimaryColor = const Color.fromRGBO(0, 0, 0, 1);
  static final _textSecondaryColor = Colors.grey.shade600;
  static final _backgroundColor = Colors.grey.shade100;
  static final _borderRadius = 14.0;

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
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: _textPrimaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _textPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: _textPrimaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: _textSecondaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: _textSecondaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _textSecondaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
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
        labelStyle: TextStyle(
          color: _textSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
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
          elevation: 2,
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(0),
      ),
    );
  }

  // static ThemeData lightThemeOld() {
  //   return ThemeData(
  //     useMaterial3: true,
  //     colorScheme: ColorScheme(
  //       brightness: Brightness.light,
  //       primary: primaryColor,
  //       onPrimary: Colors.white,
  //       secondary: secondaryColor,
  //       onSecondary: Colors.white,
  //       tertiary: tertiaryColor,
  //       onTertiary: Colors.white,
  //       error: errorColor,
  //       onError: Colors.white,
  //       surface: Colors.white,
  //       onSurface: primaryTextColor,
  //       onSurfaceVariant: secondaryTextColor,
  //     ),
  //     appBarTheme: AppBarThemeData(surfaceTintColor: Colors.transparent),
  //     textTheme: TextTheme(
  //       displayLarge: TextStyle(
  //         fontSize: 57,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       displayMedium: TextStyle(
  //         fontSize: 45,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       displaySmall: TextStyle(
  //         fontSize: 36,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       headlineLarge: TextStyle(
  //         fontSize: 32,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       headlineMedium: TextStyle(
  //         fontSize: 28,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       headlineSmall: TextStyle(
  //         fontSize: 24,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       titleLarge: TextStyle(
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //         color: primaryTextColor,
  //       ),
  //       titleMedium: TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.bold,
  //         color: primaryTextColor,
  //       ),
  //       titleSmall: TextStyle(
  //         fontSize: 14,
  //         fontWeight: FontWeight.bold,
  //         color: secondaryTextColor,
  //       ),
  //       bodyLarge: TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.w500,
  //         color: primaryTextColor,
  //       ),
  //       bodyMedium: TextStyle(
  //         fontSize: 14,
  //         fontWeight: FontWeight.w500,
  //         color: secondaryTextColor,
  //       ),
  //       bodySmall: TextStyle(
  //         fontSize: 12,
  //         fontWeight: FontWeight.w500,
  //         color: secondaryTextColor,
  //       ),
  //       labelLarge: TextStyle(
  //         fontSize: 14,
  //         fontWeight: FontWeight.w500,
  //         color: secondaryTextColor,
  //       ),
  //       labelMedium: TextStyle(
  //         fontSize: 12,
  //         fontWeight: FontWeight.w500,
  //         color: secondaryTextColor,
  //       ),
  //       labelSmall: TextStyle(
  //         fontSize: 11,
  //         fontWeight: FontWeight.w500,
  //         color: secondaryTextColor,
  //       ),
  //     ),
  //     textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: primaryColor,
  //         foregroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //         ),
  //         textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //     filledButtonTheme: FilledButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: primaryColor,
  //         foregroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //         ),
  //         textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //     outlinedButtonTheme: OutlinedButtonThemeData(
  //       style: OutlinedButton.styleFrom(
  //         side: BorderSide(color: primaryColor, width: 2),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //         ),
  //         textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       filled: true,
  //       fillColor: Colors.grey[100],
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //         borderSide: BorderSide(color: Colors.grey.shade400),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //         borderSide: BorderSide(color: Colors.grey.shade400),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //         borderSide: BorderSide(color: primaryColor, width: 2),
  //       ),
  //       errorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //         borderSide: BorderSide(color: errorColor, width: 2),
  //       ),
  //       hintStyle: TextStyle(color: secondaryTextColor, fontSize: 14),
  //       labelStyle: TextStyle(color: secondaryTextColor),
  //       floatingLabelStyle: TextStyle(color: primaryColor),
  //     ),
  //     cardTheme: CardThemeData(
  //       color: Colors.white,
  //       elevation: 1,
  //       margin: const EdgeInsets.all(0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //       ),
  //     ),
  //     dialogTheme: DialogThemeData(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(borderRadius),
  //       ),
  //     ),
  //   );
  // }
}
