import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';

class HadethCard extends StatelessWidget {
  String title;
  String content;
  HadethCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.gold,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/hadethcard.png"),
          )),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColor.gold,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: FontsName.janafont),
          ),

          Text(content, style:  const TextStyle(
                color: AppColor.gold,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: FontsName.janafont),)
        ],
      ),
    );
  }
}
