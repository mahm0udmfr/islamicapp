import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/hadeth_model.dart';
import 'package:islamicapp/tabs/hadethtab/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFiles();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png"),
          ],
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
              enlargeCenterPage: true, viewportFraction: 0.75, height: 500),
          itemCount: hadethList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HadethDetailsScreen.routename,
                  arguments: hadethList[itemIndex]);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.gold,
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/hadethcard.png"),
                  )),
              child: hadethList.isEmpty
                  ? const CircularProgressIndicator(
                      color: AppColor.gold,
                    )
                  : Column(
                      spacing: 20,
                      children: [
                        Text(hadethList[itemIndex].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontsName.janafont)),
                        Expanded(
                            child: Text(hadethList[itemIndex].content.join(""),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontsName.janafont)))
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void loadHadethFiles() async {
    for (var i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/Hadeeth/h$i.txt');
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines.first;
      hadethLines.remove(title);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
