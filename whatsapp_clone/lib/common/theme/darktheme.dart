import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/common/extensions/customs_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colours.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: Colours.backgroundDark,
    scaffoldBackgroundColor: Colours.backgroundDark,
    extensions: [
      CustomThemeExtension.darkMode,
    ],
    appBarTheme: AppBarTheme(
      backgroundColor: Colours.greyBackground,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colours.greyDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colours.greyDark),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colours.greenDark,
          width: 3,
        ),
      ),
      unselectedLabelColor: Colours.greyDark,
      labelColor: Colours.greenDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.greenDark,
        foregroundColor: Colours.backgroundDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colours.greyBackground,
      modalBackgroundColor: Colours.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: Colours.greyBackground,
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
