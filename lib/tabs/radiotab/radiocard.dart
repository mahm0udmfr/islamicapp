import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.gold,
          image: const DecorationImage(
              image: AssetImage("assets/images/radiocardoffbg.png"))),
      child: Column(
        children: [
          const Text(
            "Radio Ibrahim Elakhdar",
            style: TextStyle(
                fontSize: 20,
                fontFamily: FontsName.janafont,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 44,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 44,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_up,
                    size: 44,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
