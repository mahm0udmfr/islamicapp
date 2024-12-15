import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text("Building Time",style: TextStyle(
                        color: AppColor.white,
                        fontFamily: FontsName.janafont,
                        fontSize: 24),),
    );
  }
}
