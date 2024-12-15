import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  String tasbehName = "سبحان الله";
  double rotationDegree = 0.0;
  List<String> tasbehitems = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png"),
          ],
        ),
        const Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(
                color: AppColor.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: FontsName.janafont)),
        InkWell(
          onTap: () {
            tasbeh();
            rotateImage();
            setState(() {});
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: rotationDegree,
                child: Image.asset(
                  "assets/images/sebha.png",
                  width: screensize.width,
                  height: screensize.height / 1.7,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tasbehName,
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontsName.janafont)),
                  const SizedBox(height: 8),
                  Text(counter.toString(),
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontsName.janafont)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  int index = 0;

  void tasbeh() {
    if (counter == 33) {
      counter = 0;
      if (index == tasbehitems.length - 1) {
        index = 0;
      } else {
        index++;
      }
      tasbehName = tasbehitems[index];
    } else {
      counter++;
    }
  }

  void rotateImage() {
    setState(() {
      rotationDegree += 0.190;
    });
  }
}
