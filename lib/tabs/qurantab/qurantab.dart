import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/sura_model.dart';
import 'package:islamicapp/tabs/qurantab/sura_details_screen.dart';
import 'package:islamicapp/tabs/qurantab/suras_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColor.gold)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColor.gold, width: 2)),
                prefixIcon: Image.asset(
                  "assets/images/quran.png",
                  color: AppColor.gold,
                ),
                hintText: "Sura Name",
                hintStyle: const TextStyle(
                    color: AppColor.white, fontFamily: FontsName.janafont)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Most Recently",
            style: TextStyle(
                color: AppColor.white,
                fontFamily: FontsName.janafont,
                fontSize: 16),
          ),
          Container(
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
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sura Name",
                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 24),
                  ),
                  Text(
                    "اسم الصورة",
                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 24),
                  ),
                  Text(
                    "114 Verses",
                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: FontsName.janafont,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Suras List",
            style: TextStyle(
                color: AppColor.white, fontFamily: FontsName.janafont),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 0),
                itemBuilder: (context, index) => SurasList(
                      suraModel: SuraModel.getSuraModel(index),
                      onTap: () => Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routename,
                          arguments: SuraModel.getSuraModel(index)),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                      color: AppColor.white,
                      indent: 1,
                    ),
                itemCount: SuraModel.getItemCount()),
          )
        ],
      ),
    );
  }
}
