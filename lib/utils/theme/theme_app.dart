import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: Color(0xFFF8F4FF),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      colorScheme: colorScheme,
      elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
      outlinedButtonTheme: outlinedButtonThemeData(colorScheme),
      primaryColor: colorScheme.primary,
      brightness: Brightness.light,
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      floatingActionButtonTheme: floatingActionButtonThemeData(colorScheme),
    );
  }

  static ColorScheme colorScheme = const ColorScheme.light(
    primary: Color(0xFFDD54BF),
    primaryContainer: Color(0xFFB73E8C),
    onPrimary: Colors.white,
    secondary: Color(0xFFCEA2F2),
    secondaryContainer: Color(0xFFD0BEF7),
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
    surface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  );
  static const MaterialColor gereAulasColor = MaterialColor(
    0xFFDD54BF,
    <int, Color>{
      50: Color(0xFFDDDAFB),
      100: Color(0xFFD0BEF7),
      200: Color(0xFFCEA2F2),
      300: Color(0xFFD587EC),
      400: Color(0xFFE46DE5),
      500: Color(0xFFDD54BF),
      600: Color(0xFFB73E8C),
      700: Color(0xFF8E2B5E),
      800: Color(0xFF621A35),
      900: Color(0xFF340C16),
      1000: Color(0xFF030101)
    },
  );
  static ElevatedButtonThemeData elevatedButtonThemeData(
          ColorScheme colorScheme) =>
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
        minimumSize: const Size(double.infinity, 36.0),
      ).copyWith(foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.disabled)
            ? colorScheme.onBackground.withOpacity(0.4)
            : colorScheme.onPrimary;
      })));

  static OutlinedButtonThemeData outlinedButtonThemeData(
          ColorScheme colorScheme) =>
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.onBackground,
              disabledForegroundColor: colorScheme.onBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
              minimumSize: const Size(double.infinity, 36.0),
              backgroundColor: colorScheme.background,
              side: BorderSide(
                  width: 1.0, color: colorScheme.secondaryContainer)));

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      alignLabelWithHint: true,
      hintStyle: TextStyle(color: colorScheme.onBackground.withOpacity(0.6)),
    );
  }

  static FloatingActionButtonThemeData floatingActionButtonThemeData(
          ColorScheme colorScheme) =>
      FloatingActionButtonThemeData(
          foregroundColor: colorScheme.onSecondary,
          backgroundColor: colorScheme.secondaryContainer);
}
