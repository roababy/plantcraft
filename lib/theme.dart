import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
}

class AppRadius {
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 4.0;
  static const double full = 9999.0;
}

class LightModeColors {
  static const primary = Color(0xFF1A1A1A);
  static const onPrimary = Color(0xFFFFFFFF);
  static const secondary = Color(0xFF4B5563);
  static const onSecondary = Color(0xFFFFFFFF);
  static const accent = Color(0xFF22D3EE);
  static const background = Color(0xFFF9FAFB);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF111827);
  static const primaryText = Color(0xFF111827);
  static const secondaryText = Color(0xFF6B7280);
  static const hint = Color(0xFF9CA3AF);
  static const error = Color(0xFFEF4444);
  static const onError = Color(0xFFFFFFFF);
  static const success = Color(0xFF22C55E);
  static const divider = Color(0xFFE5E7EB);
  static const transparent = Color(0x00000000);
}

class DarkModeColors {
  static const primary = Color(0xFFF9FAFB);
  static const onPrimary = Color(0xFF000000);
  static const secondary = Color(0xFF9CA3AF);
  static const onSecondary = Color(0xFF000000);
  static const accent = Color(0xFF22D3EE);
  static const background = Color(0xFF000000);
  static const surface = Color(0xFF111111);
  static const onSurface = Color(0xFFF3F4F6);
  static const primaryText = Color(0xFFF3F4F6);
  static const secondaryText = Color(0xFF9CA3AF);
  static const hint = Color(0xFF4B5563);
  static const error = Color(0xFFF87171);
  static const onError = Color(0xFF000000);
  static const success = Color(0xFF4ADE80);
  static const divider = Color(0xFF262626);
  static const transparent = Color(0x00000000);
}

// Extension to access custom colors via Theme
extension CustomColorScheme on ColorScheme {
  Color get accent => brightness == Brightness.light ? LightModeColors.accent : DarkModeColors.accent;
  Color get success => brightness == Brightness.light ? LightModeColors.success : DarkModeColors.success;
  Color get divider => brightness == Brightness.light ? LightModeColors.divider : DarkModeColors.divider;
  Color get hint => brightness == Brightness.light ? LightModeColors.hint : DarkModeColors.hint;
  Color get primaryText => brightness == Brightness.light ? LightModeColors.primaryText : DarkModeColors.primaryText;
}

ThemeData get lightTheme => _buildTheme(Brightness.light);
ThemeData get darkTheme => _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final isLight = brightness == Brightness.light;
  final colors = isLight ? ColorScheme.light(
    primary: LightModeColors.primary,
    onPrimary: LightModeColors.onPrimary,
    secondary: LightModeColors.secondary,
    onSecondary: LightModeColors.onSecondary,
    error: LightModeColors.error,
    onError: LightModeColors.onError,
    surface: LightModeColors.surface,
    onSurface: LightModeColors.onSurface,
  ) : ColorScheme.dark(
    primary: DarkModeColors.primary,
    onPrimary: DarkModeColors.onPrimary,
    secondary: DarkModeColors.secondary,
    onSecondary: DarkModeColors.onSecondary,
    error: DarkModeColors.error,
    onError: DarkModeColors.onError,
    surface: DarkModeColors.surface,
    onSurface: DarkModeColors.onSurface,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colors,
    scaffoldBackgroundColor: isLight ? LightModeColors.background : DarkModeColors.background,
    dividerColor: isLight ? LightModeColors.divider : DarkModeColors.divider,
    iconTheme: IconThemeData(
      color: isLight ? LightModeColors.primaryText : DarkModeColors.primaryText,
    ),
    cardTheme: CardThemeData(
      color: isLight ? LightModeColors.surface : DarkModeColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(color: isLight ? LightModeColors.divider : DarkModeColors.divider, width: 1),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    textTheme: _buildTextTheme(isLight),
  );
}

TextTheme _buildTextTheme(bool isLight) {
  final primaryColor = isLight ? LightModeColors.primaryText : DarkModeColors.primaryText;
  final secondaryColor = isLight ? LightModeColors.secondaryText : DarkModeColors.secondaryText;

  // Secondary font: Space Grotesk
  final displayFont = GoogleFonts.spaceGrotesk;
  // Primary font: Inter
  final bodyFont = GoogleFonts.inter;

  return TextTheme(
    headlineLarge: displayFont(fontSize: 32, fontWeight: FontWeight.w700, height: 1.1, color: primaryColor),
    headlineMedium: displayFont(fontSize: 26, fontWeight: FontWeight.w600, height: 1.2, color: primaryColor),
    headlineSmall: displayFont(fontSize: 24, fontWeight: FontWeight.w600, height: 1.2, color: primaryColor), // Added to match design spec
    titleLarge: displayFont(fontSize: 20, fontWeight: FontWeight.w600, height: 1.2, color: primaryColor),
    titleMedium: bodyFont(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4, color: primaryColor),
    titleSmall: bodyFont(fontSize: 14, fontWeight: FontWeight.w500, height: 1.4, color: primaryColor),
    bodyLarge: bodyFont(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: primaryColor),
    bodyMedium: bodyFont(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, color: primaryColor),
    bodySmall: bodyFont(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4, color: secondaryColor),
    labelLarge: displayFont(fontSize: 14, fontWeight: FontWeight.w600, height: 1.2, color: secondaryColor),
    labelMedium: displayFont(fontSize: 12, fontWeight: FontWeight.w600, height: 1.2, color: secondaryColor),
    labelSmall: displayFont(fontSize: 10, fontWeight: FontWeight.w700, height: 1.1, color: secondaryColor),
  );
}
