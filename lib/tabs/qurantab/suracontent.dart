import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';

class SuraContent extends StatelessWidget {
  final String suracontent;
  final int index;
  final int currentindex;
  final Function(int) onTap;

  const SuraContent({
    super.key,
    required this.suracontent,
    required this.index,
    required this.currentindex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: (currentindex == index) ? AppColor.gold : AppColor.tranparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.gold, width: 2),
        ),
        child: Text(
          '$suracontent[${index + 1}]',
          style: TextStyle(
            color: (currentindex == index) ? AppColor.black : AppColor.gold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
