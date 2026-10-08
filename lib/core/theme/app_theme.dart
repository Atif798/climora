import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // COLORS

  static const Color primaryColor = Color(0xFFF97316);
  static const Color primaryContainerColor = Color(0xFFFB923C);

  static const Color scaffoldColor = Color(0xFFFFF8F3);
  static const Color surfaceColor = Colors.white;

  static const Color textPrimaryColor = Color(0xFF292524);
  static const Color textSecondaryColor = Color(0xFF78716C);
  static const Color textHintColor = Color(0xFFA8A29E);

  static const Color borderColor = Color(0xFFE7E5E4);

  static const Color onPrimaryColor = Colors.white;
  static const Color errorColor = Color(0xFFD32F2F);

// WEATHER ICON COLORS

  static const Color sunnyIconColor = Color(0xFFFACC15);
  static const Color cloudyIconColor = Color(0xFFE5E7EB);
  static const Color rainyIconColor = Color(0xFF7DD3FC);
  static const Color stormIconColor = Color(0xFFFBBF24);
  static const Color snowIconColor = Color(0xFF67E8F9);
  static const Color mistIconColor = Color(0xFFCBD5E1);

  // ONBOARDING COLORS — 3 slides

  // Slide 1 — (Purple)
  static const Color onboardingSlide1Start = Color(0xFFA78BFA);
  static const Color onboardingSlide1End = Color(0xFF7C3AED);
  static const Color onboardingSlide1Accent = Color(0xFF7C3AED);

  // Slide 2 — (Orange)
  static const Color onboardingSlide2Start = Color(0xFFFFB347);
  static const Color onboardingSlide2End = Color(0xFFF97316);
  static const Color onboardingSlide2Accent = Color(0xFFF97316);

  // Slide 3 — (Coral)
  static const Color onboardingSlide3Start = Color(0xFFFF8A9C);
  static const Color onboardingSlide3End = Color(0xFFE84A5F);
  static const Color onboardingSlide3Accent = Color(0xFFE84A5F);

  // FONT

  static TextTheme get _textTheme {
    return GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textSecondaryColor,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
    );
  }

  // WEATHER HEADER STYLES

  static TextStyle get weatherBrand {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
    );
  }

  static TextStyle get weatherHeaderTitle {
    return GoogleFonts.poppins(
      fontSize: 26,
      fontWeight: FontWeight.w800,
      color: onPrimaryColor,
    );
  }

  static TextStyle get weatherHeaderSubtitle {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: onPrimaryColor.withValues(alpha: 0.82),
    );
  }

  static TextStyle get weatherSearchInput {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textPrimaryColor,
    );
  }

  static TextStyle get weatherSearchHint {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textHintColor,
    );
  }

  // WEATHER UNIT TOGGLE

  static TextStyle get weatherUnitActive {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.2,
      color: primaryColor,
    );
  }

  static TextStyle get weatherUnitInactive {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.2,
      color: onPrimaryColor,
    );
  }

  // CURRENT WEATHER

  static TextStyle get weatherLocation {
    return GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
    );
  }

  static TextStyle get weatherDate {
    return GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: onPrimaryColor.withValues(alpha: 0.78),
    );
  }

  static TextStyle get weatherTemperature {
    return GoogleFonts.poppins(
      fontSize: 44,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
      height: 0.95,
      letterSpacing: -1,
    );
  }

  static TextStyle get weatherUnit {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: onPrimaryColor.withValues(alpha: 0.90),
    );
  }

  static TextStyle get weatherDescription {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: onPrimaryColor.withValues(alpha: 0.82),
    );
  }

  static TextStyle get weatherFeelsLikeLabel {
    return GoogleFonts.poppins(
      fontSize: 9,
      fontWeight: FontWeight.w500,
      color: onPrimaryColor.withValues(alpha: 0.72),
    );
  }

  static TextStyle get weatherFeelsLikeValue {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
    );
  }

  // WEATHER INFO CARDS

  static TextStyle get weatherInfoLabel {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: textSecondaryColor,
    );
  }

  static TextStyle get weatherInfoValue {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: textPrimaryColor,
    );
  }

  // FORECAST

  static TextStyle get forecastDay {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: textPrimaryColor,
    );
  }

  static TextStyle get forecastDayActive {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
    );
  }

  static TextStyle get forecastDate {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: textSecondaryColor,
    );
  }

  static TextStyle get forecastDateActive {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: onPrimaryColor.withValues(alpha: 0.78),
    );
  }

  static TextStyle get forecastCondition {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: textSecondaryColor,
    );
  }

  static TextStyle get forecastConditionActive {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: onPrimaryColor.withValues(alpha: 0.82),
    );
  }

  static TextStyle get forecastMaxTemperature {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: textPrimaryColor,
    );
  }

  static TextStyle get forecastMaxTemperatureActive {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: onPrimaryColor,
    );
  }

  static TextStyle get forecastMinTemperature {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: textSecondaryColor,
    );
  }

  static TextStyle get forecastMinTemperatureActive {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: onPrimaryColor.withValues(alpha: 0.78),
    );
  }

  static TextStyle get forecastRainProbability {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: textSecondaryColor,
    );
  }

  static TextStyle get forecastRainProbabilityActive {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: onPrimaryColor.withValues(alpha: 0.82),
    );
  }

  // EMPTY / LOADING / ERROR STATES

  static TextStyle get stateTitle {
    return GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: textPrimaryColor,
    );
  }

  static TextStyle get stateMessage {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: textSecondaryColor,
    );
  }

  static TextStyle get errorMessage {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: errorColor,
    );
  }

  // THEME

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: primaryColor,
      primaryContainer: primaryContainerColor,
      surface: surfaceColor,
      onPrimary: onPrimaryColor,
      onPrimaryContainer: textPrimaryColor,
      onSurface: textPrimaryColor,
      onSurfaceVariant: textSecondaryColor,
      error: errorColor,
    );

    return ThemeData(
      useMaterial3: true,

      // Color Scheme

      colorScheme: colorScheme,

      // Scaffold

      scaffoldBackgroundColor: scaffoldColor,

      //Typography

      textTheme: _textTheme,

      //App Bar

      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),

      //Input

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,

        hintStyle: _textTheme.bodyMedium?.copyWith(
          color: textHintColor,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
      ),

      // Card

      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      // Icon

      iconTheme: const IconThemeData(
        color: textPrimaryColor,
      ),

      // Progress Indicator

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),

      // Snack Bar

      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryColor,      // ✅ Orange
        contentTextStyle: _textTheme.bodyMedium?.copyWith(
          color: onPrimaryColor,            // ✅ White text
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 4,
        actionTextColor: onPrimaryColor,
      ),

      // Outlined Button

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(
            color: primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: _textTheme.labelLarge,
        ),
      ),
    );
  }
}