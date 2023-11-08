import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

sealed class AnimeStickerTheme {
  static ThemeData themeDataLight = ThemeData(
    useMaterial3: true,
    primaryColor: ColorsConstantsLight.colorPrimary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsConstantsLight.colorGrayLight,
    ),
    scaffoldBackgroundColor: ColorsConstantsLight.colorGrayMedium,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsConstantsLight.colorGrayLight,
      selectedItemColor: ColorsConstantsLight.colorPrimary,
      unselectedItemColor: ColorsConstantsLight.subtle2,
      selectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 11,
        letterSpacing: 0.066,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.openSans().fontFamily,
        color: ColorsConstantsLight.subtle2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsConstantsLight.colorPrimary,
        backgroundColor: ColorsConstantsLight.colorGrayLight,
        padding: const EdgeInsets.symmetric(
          vertical: 7.07,
          horizontal: 15.708,
        ),
        textStyle: TextStyle(
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.635),
        ),
        side: const BorderSide(
          color: ColorsConstantsLight.colorPrimary,
          width: 0.655,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstantsLight.colorPrimary,
        foregroundColor: ColorsConstantsLight.colorGrayLight,
        textStyle: TextStyle(
          backgroundColor: ColorsConstantsLight.colorPrimary,
          fontFamily: GoogleFonts.openSans().fontFamily,
          // color: ColorsConstantsLight.colorGrayLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      ),
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
  );

  static ThemeData themeDataDark = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
  );
}
