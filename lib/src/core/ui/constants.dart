import 'package:flutter/material.dart';

sealed class FontConstants {
  static const fontFamily = 'OpenSans';
}

// sealed class ImageConstants {
//   static const backgroundChair = 'assets/images/background_image_chair.jpg';
//   static const imageLogo = 'assets/images/imgLogo.png';
//   static const avatar = 'assets/images/avatar.png';
// }

sealed class ColorsConstantsLight {
  static const colorGrayDark = Color(0xFFCCCED0);
  static const colorGrayLight = Color(0xFFF6F6F9);
  static const colorGrayMedium = Color(0xFFECECEE);
  static const colorPrimary = Color(0xFFBA0000);
  static const colorbackgoundMenu = Color(0xFFE3D8D2);
  static const subtle1 = Color(0xFF61646B);
  static const subtle2 = Color(0xFFAFB1B6);
  static const colorText = Color(0xFF252525);
  static const colorPurple = Color(0xFF9B59B6);
  static const colorBlack = Color(0xFF000000);
  static const colorSurface = Color(0xFFFAFAFA);
}

sealed class ColorsConstantsDark {
  static const colorGrayDark = Color(0xFF3F3F3F);
  static const colorGrayLight = Color(0xFF252525);
  static const colorGrayMedium = Color(0xFF333333);
  static const colorPrimary = Color(0xFFBA0000);
  static const colorText = Color(0xFFF6F6F9);
}
