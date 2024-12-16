import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/sura_model.dart';

class SurasList extends StatelessWidget {
  SuraModel suraModel;
  int index;
  void Function()? onTap;
  SurasList({super.key, required this.suraModel, required this.onTap,required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: const AssetImage("assets/images/sgod.png"),
        backgroundColor: AppColor.tranparent,
        child: Text(
          "${index + 1}",
          style: const TextStyle(
              color: AppColor.white,
              fontFamily: FontsName.janafont,
              fontSize: 12),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            suraModel.suraEnglishName,
            style: const TextStyle(
                color: AppColor.white,
                fontFamily: FontsName.janafont,
                fontSize: 20),
          ),
          Text(
            "${suraModel.suraVerses} Verses",
            style: const TextStyle(
                color: AppColor.white,
                fontFamily: FontsName.janafont,
                fontSize: 14),
          ),
        ],
      ),
      trailing: Text(
        suraModel.suraArabicName,
        style: const TextStyle(
            color: AppColor.white,
            fontFamily: FontsName.janafont,
            fontSize: 20),
      ),
    );
  }
}
