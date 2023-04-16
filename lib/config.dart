import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  static double radius = 16;

  static Color colorBg = Colors.black45;
  static Color colorControlBg = colorText.withOpacity(0.3);
  static Color colorbg001 = const Color.fromARGB(100, 231, 226, 214);

  static Color colorText1 = Colors.brown.withOpacity(0.65);

  static Color colorText = Colors.white.withOpacity(0.85);

  static double widthScreen = Get.size.width;
  static double heightScreen = Get.size.height;

  static TextTheme black = TextTheme(
    labelSmall: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    bodySmall: const TextStyle(
        fontFamily: 'GFont',
        color: Colors.black87,
        decoration: TextDecoration.none),
    labelLarge: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    bodyLarge: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    bodyMedium: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    displayLarge: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    displayMedium: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    displaySmall: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    headlineMedium: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    headlineSmall: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    titleLarge: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    titleMedium: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
    titleSmall: TextStyle(
        fontFamily: 'GFont', color: colorText, decoration: TextDecoration.none),
  );
}
