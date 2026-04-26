import 'package:currency_converter/app/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextTheme {
  static TextTheme light = TextTheme(
    displayLarge: GoogleFonts.baiJamjuree(fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    displayMedium: GoogleFonts.baiJamjuree(fontSize: 32, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    displaySmall: GoogleFonts.baiJamjuree(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    headlineLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    headlineMedium: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    bodyLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    bodyMedium: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.light.onSurface),
    labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurfaceVariant),
    labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurfaceVariant),
    labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.light.onSurfaceVariant),
  );

  static TextTheme dark = TextTheme(
    displayLarge: GoogleFonts.baiJamjuree(fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    displayMedium: GoogleFonts.baiJamjuree(fontSize: 32, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    displaySmall: GoogleFonts.baiJamjuree(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    headlineLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    headlineMedium: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    bodyLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    bodyMedium: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0, color: AppColorScheme.dark.onSurface),
    labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurfaceVariant),
    labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurfaceVariant),
    labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0, color: AppColorScheme.dark.onSurfaceVariant),
  );
}
