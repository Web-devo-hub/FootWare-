import 'package:flutter/material.dart';

/// Global theme switch. Starts in dark mode (your current look).
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

class AppColors {
  final bool dark;
  AppColors(this.dark);

  factory AppColors.of(BuildContext context) =>
      AppColors(Theme.of(context).brightness == Brightness.dark);

  // Bottom sheet
  Color get sheetBg => dark ? const Color(0xFF0B151F) : const Color(0xFFF3F6FA);
  Color get handle => dark ? Colors.grey.shade300 : Colors.grey.shade500;
  Color get title => dark ? const Color(0xFFF3F6FA) : const Color(0xFF0B151F);
  Color get subtitle => dark ? Colors.grey.shade300 : Colors.grey.shade700;
  Color get divider => dark ? const Color(0xFF1A2435) : const Color(0xFFD5DCE6);
  Color get icon => dark ? Colors.white : const Color(0xFF0B151F);

  // STAT card
  Color get statBg => dark ? const Color(0xFF2D1A29) : const Color(0xFFFCE8EC);
  Color get statTitle => dark ? Colors.white : const Color(0xFF2D1A29);
  Color get statText => dark ? const Color(0xFFD38894) : const Color(0xFF9B3B4D);

  // Buttons
  Color get cancelBg => dark ? const Color(0xFF1A2435) : const Color(0xFFE3E8F0);
  Color get cancelText => dark ? const Color(0xFFCBD5E1) : const Color(0xFF334155);

  // Filter cards
  Color get cardBg => dark ? const Color(0xFF0D1625) : Colors.white;
  Color get cardBorder => dark ? Colors.white : Colors.grey.shade400;
  Color get cardText => dark ? const Color(0xFFCBD5E1) : const Color(0xFF334155);
  Color get hint => dark ? const Color(0xFF6F819D) : const Color(0xFF8A97AB);
}