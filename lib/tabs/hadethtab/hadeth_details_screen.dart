import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routename = "hadethdetails";

  HadethDetailsScreen({super.key});
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
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
            spacing: 20,
            children: [
              const SizedBox(height: 17,),
              Text(args.title,  textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColor.gold,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: FontsName.janafont)),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 4),
                      child: Text(
                        args.content[index],textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: AppColor.gold,
                          
                          fontSize: 16,
                          fontFamily: FontsName.janafont,
                        ),
                      ),
                    );
                  },
                  itemCount: args.content.length,
                ),
              ),
            ],
          )),
    );
  }
}
