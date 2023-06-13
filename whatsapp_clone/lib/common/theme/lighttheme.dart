import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/common/utils/colours.dart';

import '../extensions/customs_theme_extension.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Colours.backgroundLight,
    scaffoldBackgroundColor: Colours.backgroundLight,
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    appBarTheme: AppBarTheme(
      backgroundColor: Colours.greenLight,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.white,
          width: 3,
        ),
      ),
      unselectedLabelColor: Color(0xFFB3D9D2),
      labelColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.greenLight,
        foregroundColor: Colours.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: Colours.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colours.greenDark,
      foregroundColor: Colors.white,
    ),
  );
}
