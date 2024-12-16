import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/sura_model.dart';
import 'package:islamicapp/tabs/qurantab/suracontent.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routename = "suradetails";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  int currentindex = -1;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.fileName);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: const TextStyle(color: AppColor.gold),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColor.bgblack,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/surabackground.png"),
            )),
        child: Column(
          spacing: 22,
          children: [
            const SizedBox(
              height: 0,
            ),
            Text(
              args.suraArabicName,
              style: const TextStyle(
                color: AppColor.gold,
                fontSize: 24,
                fontFamily: FontsName.janafont,
              ),
            ),
            Expanded(
              child: verses.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return SuraContent(
                          suracontent: verses[index],
                          index: index,
                          currentindex: currentindex,
                          onTap: updateCurrentIndex,
                        );
                      },
                      itemCount: verses.length,
                    ),
            )
          ],
        ),
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/Suras/$fileName');
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;
    setState(() {});
  }

  void updateCurrentIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }
}
