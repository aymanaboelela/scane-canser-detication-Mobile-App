import 'package:flutter/material.dart';

abstract class AppColors {
  // 🔵 Primary color
  static const primaryColor = Color(0xff00487c);

  // ⚪ Basics
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Colors.transparent;

  // ⚫ Greys
  static const darkGrey = Color(0xFF333333);
  static const lightGrey = Color(0xFFBDBDBD);
  static const grey = Color(0xFF9E9E9E);
  static const greyBackground = Color(0xFFF5F5F5);

  // 🔴 Errors
  static const error = Color(0xFFD32F2F);
  static const warning = Color(0xFFFFA000);

  // 🟠 Accent
  static const orange = Color(0xFFFF8C00); // Corrected spelling from "orang"
  static const yellow = Color(0xFFFFEB3B);

  // 🟢 Success
  static const success = Color(0xFF388E3C);

  // 🔵 Info
  static const info = Color(0xFF2196F3);

  // 🟣 Others
  static const shadow = Color(0x1F000000); // 12% Black for shadows
}
