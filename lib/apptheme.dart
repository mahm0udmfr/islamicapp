import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';

class Apptheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.tranparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      appBarTheme: const AppBarTheme(
          color: AppColor.bgblack,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.gold)));
}
