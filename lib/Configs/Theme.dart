import 'package:flutter/material.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: bgColor,
      onBackground: fontColor,
      primaryContainer: containerColor,
      onPrimaryContainer: labelColor),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(
        fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.w400),
  ),
);
