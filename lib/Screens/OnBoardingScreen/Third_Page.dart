import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Shared/Colors.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: AppColors.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation_llwxhk8y.json'),
                  // Image(
                  //     image: AssetImage('assets/image3-removebg-preview.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      // 'Enjoy!',
                      'We hope you enjoy using our app!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.saira(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textcolor),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } //
}
