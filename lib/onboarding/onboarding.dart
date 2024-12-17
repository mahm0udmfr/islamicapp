import 'package:flutter/material.dart';
import 'package:islamicapp/colors.dart';
import 'package:islamicapp/fontsclass.dart';
import 'package:islamicapp/homescreen.dart';
import 'package:islamicapp/onboarding/onboardinglist.dart';
import 'package:islamicapp/services.dart';

class OnBoarding extends StatefulWidget {
  static const String routename = "onboarding";
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: onBoardingList.length,
                itemBuilder: (context, i) => Column(

                  
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        onBoardingList[i].topimage ?? '',
                        height: MediaQuery.of(context).size.width / 2.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        onBoardingList[i].bodyimage ?? '',
                        height: MediaQuery.of(context).size.width / 6,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    Text(
                      onBoardingList[i].body ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.gold,
                        fontFamily: FontsName.janafont,
                        fontSize: 24,
                      ),
                    ),
                      SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Text(
                      onBoardingList[i].footer ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.gold,
                        fontFamily: FontsName.janafont,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: reversePage,
                  child: const Text("Back",
                      style: TextStyle(color: AppColor.gold)),
                ),
                ////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        onBoardingList.length,
                        (index) => AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              duration: const Duration(milliseconds: 900),
                              width: currentPage == index ? 20 : 5,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: AppColor.gold,
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                  ],
                ),

                ///
                TextButton(
                  onPressed: nextPage,
                  child: const Text(
                    "Next",
                    style: TextStyle(color: AppColor.gold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void nextPage() {
    setState(() {
      if (currentPage < onBoardingList.length - 1) {
        currentPage++;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      } else {
        MyServices.setString('step', '1');
        Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
      }
    });
  }

  void reversePage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
