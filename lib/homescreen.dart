import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/tabs/hadethtab/hadethtab.dart';
import 'package:islamicapp/tabs/qurantab/qurantab.dart';
import 'package:islamicapp/tabs/radiotab/radiotab.dart';
import 'package:islamicapp/tabs/tasbehtab/tasbehtab.dart';
import 'package:islamicapp/tabs/timetab/timetab.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "homescreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const HadethTab(),
    const TasbehTab(),
    const RadioTab(),
    const TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/${getBackGroundImage()}.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.gold,
              items: [
                BottomNavigationBarItem(
                    icon: customBottomNavBar(index: 0, imageName: "quran"),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: customBottomNavBar(index: 1, imageName: "hadeth"),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: customBottomNavBar(index: 2, imageName: "tasbeh"),
                    label: "Tasbeh"),
                BottomNavigationBarItem(
                    icon: customBottomNavBar(index: 3, imageName: "radio"),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: customBottomNavBar(index: 4, imageName: "pryertime"),
                    label: "prayer Time"),
              ]),
          body: tabs[selectedIndex])
    ]);
  }

  String getBackGroundImage() {
    switch (selectedIndex) {
      case 0:
        return "Background";
      case 1:
        return "hadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "time_bg";
      default:
        return "Background";
    }
  }

  Widget customBottomNavBar({required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.bgblack,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ImageIcon(
              AssetImage("assets/images/$imageName.png"),
            ),
          )
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
          );
  }
}
