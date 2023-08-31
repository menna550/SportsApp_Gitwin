import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Shared/Colors.dart';
import 'package:sports_app/Shared/Fonts.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation_llxdii92.json',
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.30),
                  // Image(
                  //     image: AssetImage('assets/image1-removebg-preview.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome to our app!',
                    style: GoogleFonts.saira(
                        fontSize: AppFonts.fontsize24,
                        fontWeight: AppFonts.fontWeight700,
                        color: AppColors.textcolor),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'We are excited to help you stay up-to-date on your favorite sports.',
                      style: GoogleFonts.saira(color: AppColors.textcolor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
