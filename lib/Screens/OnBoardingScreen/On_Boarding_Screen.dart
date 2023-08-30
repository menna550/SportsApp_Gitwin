import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_app/Screens/OnBoardingScreen/Frist_Page.dart';
import 'package:sports_app/Screens/OnBoardingScreen/Third_Page.dart';
import 'package:sports_app/Shared/Colors.dart';

import 'Second_Page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: const [
                FristPage(),
                SecondPage(),
                ThirdPage(),
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
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {},
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
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.textcolor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
