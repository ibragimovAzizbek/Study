import 'package:flutter/material.dart';

class ColorConst {
  static Color kPrimaryColor = const Color(0xFF4178D4);
  static Color kPrimaryColor100 = const Color(0xFFD9E4F6);
  static Color kPrimaryScaffoldColor = const Color(0xFFeeeeee);
  static Color kWhite = const Color(0xFFFFFFFF);
  static Color kButtonColor = const Color(0xFF52B6DF);
  static Color kSecondPageTextColor = const Color(0xFF64748B);
  static Color kWarning = const Color(0xFFB45309);
  static Color kNeutral = const Color(0xFF64748B);
  static Color kScondry = const Color(0xFF52B6DF);
  static Color kScondry100 = const Color(0xFFDCF0F9);

  static Color kWarning500 = const Color(0xFFF59E0B);
  static Color kNeutral700 = const Color(0xFF334155);
  static Color kWarning100 = const Color(0xFFFCE2B6);
  static Color kNeutral900 = const Color(0xFF0F172A);

  static Color kTransparentColor = Colors.transparent;

  static Color kBlack = Colors.black;
  static const Color kRed = Colors.red;

  static Gradient kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF52B6DF).withOpacity(0.1),
      const Color(0xFF4178D4),
    ],
  );

  static Gradient kContainerGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF27487F),
      Color(0xFF52B6DF),
    ],
  );
}
