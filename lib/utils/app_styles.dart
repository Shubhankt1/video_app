import 'package:flutter/material.dart';

class AppThemes {
  // LIGHT THEME
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF0277BD),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0277BD),
        secondary: Color(0xFF00ACC1),
      ),
      scaffoldBackgroundColor: const Color(0xFFE0F7FA),
      hintColor: Colors.grey,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF212121)),
        bodyMedium: TextStyle(color: Color(0xFF757575)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0277BD),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          // backgroundColor: WidgetStateProperty.all(const Color(0xFF01579B)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey; // Color for disabled state
              }
              return const Color(0xFF01579B); // Regular color for enabled state
            },
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF01579B),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF01579B),
          ),
        ),
      ),
    );
  }

  // DARK THEME
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF0277BD),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF0277BD),
        secondary: Color(0xFF00ACC1),
      ),
      scaffoldBackgroundColor: const Color(0xFF303030),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFFFFFFF)),
        bodyMedium: TextStyle(color: Color(0xFFB3B3B3)),
      ),
      hintColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0277BD),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          // backgroundColor: WidgetStateProperty.all(const Color(0xFF0277BD)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey; // Color for disabled state
              }
              return const Color(0xFF0277BD); // Regular color for enabled state
            },
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF00ACC1),
      ),
    );
  }
}
