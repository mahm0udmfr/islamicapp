import 'package:flutter/material.dart';
import 'package:islamicapp/apptheme.dart';
import 'package:islamicapp/homescreen.dart';
import 'package:islamicapp/tabs/hadethtab/hadeth_details_screen.dart';
import 'package:islamicapp/tabs/qurantab/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      darkTheme: Apptheme.darkTheme,
      themeMode:ThemeMode.dark,
      routes: {
        HomeScreen.routename: (context) => const HomeScreen(),
        SuraDetailsScreen.routename: (context) => const SuraDetailsScreen(),
        HadethDetailsScreen.routename: (context) =>  HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routename,
    );
  }
}
