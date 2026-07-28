import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF461A3B);
  static const Color background = Color(0xFFF8F6F9);
  static const Color splashText = Color(0xFF4F444A);
  static const Color colorTransparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color gray = Color(0xFF8E8E93);

  // Core design system colors (from Stitch palette)
  static const Color secondaryColor = Color(0xFF8A6F80);
  static const Color tertiaryColor = Color(0xFF163104);
  static const Color neutralColor = Color(0xFFF8F9FA);

  // Extended palette (derived from design system)
  static const Color primaryLight = Color(0xFF8A6F80);
  static const Color primaryLighter = Color(0xFFF3E8F0);
  static const Color primaryDark = Color(0xFF321028);
  static const Color tertiaryGreen = Color(0xFF163104);
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color borderSubtle = Color(0xFFECDCE7);

  // ===== UI Gradients =====
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF852267), Color(0xFF461A3B), Color(0xFF2D0B24)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient userHeaderGradient = LinearGradient(
    colors: [Color(0xFF8A246B), Color(0xFF531943), Color(0xFF2D0A23)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient venueOwnerHeaderGradient = LinearGradient(
    colors: [Color(0xFF388E12), Color(0xFF1E4D09), Color(0xFF0F2604)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient coachHeaderGradient = LinearGradient(
    colors: [Color(0xFF91235F), Color(0xFF4E163B), Color(0xFF2B0B20)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFBF1F7), Color(0xFFF3E2EE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFFCF7FA), Color(0xFFF9F9F9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF3B8206), Color(0xFF1B4006)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Semantic Colors
  static const Color textHint = neutral500;

  static const Color surfaceHover = primary50;

  static const Color accentSurface = tertiary50;

  //  Primary shades (Purple/Maroon)
  static const Color primary50 = Color(0xFFFCE9F5);
  static const Color primary100 = Color(0xFFF3C9E4);
  static const Color primary200 = Color(0xFFE39BC8);
  static const Color primary300 = Color(0xFFC96FA3);
  static const Color primary400 = Color(0xFF8F4770);
  static const Color primary500 = Color(0xFF461A3B);
  static const Color primary600 = Color(0xFF39152F);
  static const Color primary700 = Color(0xFF2C1024);
  static const Color primary800 = Color(0xFF1E0A18);
  static const Color primary900 = Color(0xFF0D0409);

  // Secondary shades (Mauve)
  static const Color secondary50 = Color(0xFFFCEEF3);
  static const Color secondary100 = Color(0xFFF4D6E1);
  static const Color secondary200 = Color(0xFFE3B7C8);
  static const Color secondary300 = Color(0xFFC79AAE);
  static const Color secondary400 = Color(0xFFA8829B);
  static const Color secondary500 = Color(0xFF8A6F80);
  static const Color secondary600 = Color(0xFF6D5765);
  static const Color secondary700 = Color(0xFF50404A);
  static const Color secondary800 = Color(0xFF332830);
  static const Color secondary900 = Color(0xFF0D0A0C);

  //  Tertiary shades (Green)
  static const Color tertiary50 = Color(0xFFEBF5E4);
  static const Color tertiary100 = Color(0xFFCFE8BB);
  static const Color tertiary200 = Color(0xFFA9D186);
  static const Color tertiary300 = Color(0xFF7EB84F);
  static const Color tertiary400 = Color(0xFF4C8524);
  static const Color tertiary500 = Color(0xFF163104);
  static const Color tertiary600 = Color(0xFF122803);
  static const Color tertiary700 = Color(0xFF0D1E02);
  static const Color tertiary800 = Color(0xFF081402);
  static const Color tertiary900 = Color(0xFF040A01);

  //  Neutral shades (Gray)
  static const Color neutral50 = Color(0xFFFFFFFF);
  static const Color neutral100 = Color(0xFFF8F9FA);
  static const Color neutral200 = Color(0xFFE9EAEC);
  static const Color neutral300 = Color(0xFFD3D5D9);
  static const Color neutral400 = Color(0xFFAFB2B8);
  static const Color neutral500 = Color(0xFF8A8D94);
  static const Color neutral600 = Color(0xFF64676E);
  static const Color neutral700 = Color(0xFF404247);
  static const Color neutral800 = Color(0xFF232426);
  static const Color neutral900 = Color(0xFF0A0A0B);
}