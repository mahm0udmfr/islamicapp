import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/tabs/radiotab/radiocard.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png"),
            ],
          ),
          TabBar(
            tabs: <Widget>[
              Tab(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.gold,
                        padding: const EdgeInsets.symmetric(horizontal: 40)),
                    onPressed: () {},
                    child: const Text("Radio1",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.black,
                            fontFamily: FontsName.janafont,
                            fontWeight: FontWeight.bold))),
              ),
              Tab(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.black,
                        padding: const EdgeInsets.symmetric(horizontal: 40)),
                    onPressed: () {},
                    child: const Text("Radio 2",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.white,
                            fontFamily: FontsName.janafont,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) => const RadioCard(),
                  itemCount: 10,
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) => const RadioCard(),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
