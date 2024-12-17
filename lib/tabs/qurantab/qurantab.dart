import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/sura_model.dart';
import 'package:islamicapp/services.dart';
import 'package:islamicapp/tabs/qurantab/sura_details_screen.dart';
import 'package:islamicapp/tabs/qurantab/suras_list.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  final TextEditingController controller = TextEditingController();
  List<SuraModel> filterList = [];
  String searchText = '';
  int loadLastSura = -1;

  @override
  void initState() {
    super.initState();
    if (SuraModel.suraList.isEmpty) {
      addSuraList();
    }
    filterList = SuraModel.suraList;
    loadSura();
  }

  void addSuraList() {
    for (var i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraArabicName: SuraModel.arabicAuranSuras[i],
          suraEnglishName: SuraModel.englishQuranSurahs[i],
          suraVerses: SuraModel.ayaNumber[i],
          fileName: "${i + 1}.txt"));
    }
  }

  void saveLastSura({required int suraIndex}) {
    MyServices.setInt('suraIndex', suraIndex);
    loadSura();
  }

  int getLastSura() {
    return MyServices.getInt('suraIndex') ?? -1;
  }

  void loadSura() {
    setState(() {
      loadLastSura = getLastSura();
    });
  }

  Widget buildMostRecent() {
    if (loadLastSura == -1 || loadLastSura >= SuraModel.suraList.length) {
      return const SizedBox.shrink();
    }
    final recentSura = SuraModel.suraList[loadLastSura];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Most Recently",
          style: TextStyle(
              color: AppColor.white,
              fontFamily: FontsName.janafont,
              fontSize: 16),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                SuraDetailsScreen.routename,
                arguments: recentSura);
          },
          child: Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.gold,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/images/moshaf.png"),
                  alignment: Alignment.centerRight),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recentSura.suraEnglishName,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 24),
                  ),
                  Text(
                    recentSura.suraArabicName,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 24),
                  ),
                  Text(
                    "${recentSura.suraVerses} Verses",
                    style: const TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png"),
            ],
          ),
          TextField(
            controller: controller,
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontFamily: FontsName.janafont,
                fontWeight: FontWeight.bold),
            onChanged: (value) {
              setState(() {
                searchText = value;
                filterList = SuraModel.suraList.where((sura) {
                  return sura.suraArabicName.contains(searchText) ||
                      sura.suraEnglishName
                          .toLowerCase()
                          .contains(searchText.toLowerCase());
                }).toList();
              });
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColor.gold),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColor.gold, width: 2),
              ),
              prefixIcon: Image.asset(
                "assets/images/quran.png",
                color: AppColor.gold,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  controller.clear();
                  setState(() {
                    searchText = '';
                    filterList = List.from(SuraModel.suraList);
                  });
                },
                child: const Icon(
                  Icons.close,
                  color: AppColor.gold,
                ),
              ),
              hintText: "Sura Name",
              hintStyle: const TextStyle(
                  color: AppColor.white, fontFamily: FontsName.janafont),
            ),
          ),
          const SizedBox(height: 10),
          searchText.isEmpty ? buildMostRecent() : const SizedBox.shrink(),
          const Text(
            "Suras List",
            style: TextStyle(
                color: AppColor.white, fontFamily: FontsName.janafont),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (context, index) => SurasList(
                index: index,
                suraModel: filterList[index],
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SuraDetailsScreen.routename,
                    arguments: filterList[index],
                  );
                  saveLastSura(
                    suraIndex: int.parse(
                          filterList[index].fileName.replaceAll(".txt", ""),
                        ) -
                        1,
                  );
                },
              ),
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
                color: AppColor.white,
                indent: 1,
              ),
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }
}
