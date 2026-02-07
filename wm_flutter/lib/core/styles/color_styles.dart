import 'package:flutter/material.dart';

class AppColors {
  // ═══════════════════════════════════════════
  // PRIMARY — Botanical Forest Palette
  // ═══════════════════════════════════════════
  static const Color forest = Color(0xFF0B3D2E);
  static const Color forestMid = Color(0xFF145A3E);
  static const Color emerald = Color(0xFF1B9E6B);
  static const Color mint = Color(0xFF3DD9A0);
  static const Color sage = Color(0xFFA8D5BA);

  // ═══════════════════════════════════════════
  // NEUTRALS — Warm, not clinical
  // ═══════════════════════════════════════════
  static const Color cream = Color(0xFFFBF8F3);
  static const Color pearl = Color(0xFFF4F1EC);
  static const Color warmWhite = Color(0xFFFEFDFB);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color graphite = Color(0xFF3D3D3D);
  static const Color slate = Color(0xFF6B7280);
  static const Color silver = Color(0xFF9CA3AF);
  static const Color mist = Color(0xFFE8E5E0);

  // ═══════════════════════════════════════════
  // ACCENTS
  // ═══════════════════════════════════════════
  static const Color gold = Color(0xFFD4A853);
  static const Color goldLight = Color(0xFFF5E6C8);
  static const Color coral = Color(0xFFE8735A);
  static const Color coralSoft = Color(0xFFFFF0EC);

  // ═══════════════════════════════════════════
  // SEMANTIC
  // ═══════════════════════════════════════════
  static const Color success = emerald;
  static const Color error = Color(0xFFDC3545);
  static const Color warning = gold;
  static const Color info = Color(0xFF306DD0);

  // ═══════════════════════════════════════════
  // BACKWARDS COMPATIBILITY
  // Maps old names → new palette so existing code works.
  // ═══════════════════════════════════════════
  static const Color primary = sage;
  static const Color primaryDark = emerald;
  static const Color primaryLight = Color(0xFFEBFFD7);
  static const Color primaryLink = Color(0xFF407EC7);
  static const Color primaryTextInfo = slate;
  static const Color primaryTextTitle = charcoal;

  static const Color lightGreen = mint;
  static const Color darkGreen = forest;

  static const Color darkBlue = Color(0xFF16248A);
  static const Color lightBlue = Color(0xFF306DD0);

  static const Color lightBackground = cream;
  static const Color darkBackground = Color(0xFF121212);

  static const Color brandColor = emerald;
  static const Color whiteShade = pearl;
  static const Color dangerColor = coral;
  static const Color themeColor = forest;
}
