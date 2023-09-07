import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Screens/OnBoardingScreen/Frist_Page.dart';
import 'package:sports_app/Screens/OnBoardingScreen/Third_Page.dart';
import 'package:sports_app/Screens/Register_Screen.dart';
import 'package:sports_app/Shared/Colors.dart';

import 'Second_Page.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;
  //late Timer _timer;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage == 2) {
        _controller.jumpToPage(0);
      } else {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: PageView(
              controller: _controller,
              onPageChanged: (page) {
                currentPage = page;
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              activeDotColor: AppColors.textcolor,
              dotColor: AppColors.textcolor.withOpacity(0.15),
              dotHeight: 10,
              dotWidth: 10,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Set isFirstRun to false so that the onboarding screen will not be shown again
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setBool('isFirstRun', false);
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Skip',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textcolor,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.textcolor,
                        size: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
