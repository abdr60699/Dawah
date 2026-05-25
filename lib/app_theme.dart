import 'package:flutter/material.dart';

/// Premium design system inspired by Lollypop.design + Apple
class C {
  // Backgrounds
  static const Color bg = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bgDark = Color(0xFF141318);
  static const Color bgDark2 = Color(0xFF1C1B22);
  static const Color card = Color(0xFFFFFFFF);

  // Text
  static const Color heading = Color(0xFF1A1A2E);
  static const Color body = Color(0xFF555568);
  static const Color caption = Color(0xFF8A8A9A);
  static const Color onDark = Color(0xFFF5F5F7);
  static const Color onDarkSub = Color(0xFFB0B0C0);

  // Accents
  static const Color accent = Color(0xFF2563EB); // rich blue
  static const Color green = Color(0xFF059669);
  static const Color red = Color(0xFFDC2626);
  static const Color gold = Color(0xFFD97706);
  static const Color purple = Color(0xFF7C3AED);
  static const Color teal = Color(0xFF0D9488);

  // UI
  static const Color border = Color(0xFFE8E8ED);
  static const Color divider = Color(0xFFF0F0F3);
  static const Color shadow = Color(0x12000000);

  /// Card shadow — soft, premium
  static List<BoxShadow> get cardShadow => [
        const BoxShadow(
          color: Color(0x08000000),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
        const BoxShadow(
          color: Color(0x06000000),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ];

  /// Elevated shadow — for hover / prominent cards
  static List<BoxShadow> get elevatedShadow => [
        const BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
        const BoxShadow(
          color: Color(0x08000000),
          blurRadius: 40,
          offset: Offset(0, 16),
        ),
      ];
}

// ─── Responsive ───
bool isMobile(BuildContext c) => MediaQuery.of(c).size.width < 735;
bool isTablet(BuildContext c) =>
    MediaQuery.of(c).size.width >= 735 && MediaQuery.of(c).size.width < 1080;
bool isDesktop(BuildContext c) => MediaQuery.of(c).size.width >= 1080;

double contentMax(BuildContext c) {
  final w = MediaQuery.of(c).size.width;
  if (w >= 1440) return 1080;
  if (w >= 1080) return 960;
  return w;
}

EdgeInsets sectionPad(BuildContext c) {
  final w = MediaQuery.of(c).size.width;
  final h = isMobile(c) ? 56.0 : 80.0;
  if (w >= 1440) return EdgeInsets.symmetric(horizontal: (w - 1080) / 2, vertical: h);
  if (w >= 1080) return EdgeInsets.symmetric(horizontal: (w - 960) / 2, vertical: h);
  if (w >= 735) return EdgeInsets.symmetric(horizontal: 48, vertical: h);
  return EdgeInsets.symmetric(horizontal: 24, vertical: h);
}
