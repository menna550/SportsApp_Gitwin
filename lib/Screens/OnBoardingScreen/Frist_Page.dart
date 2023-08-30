import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Shared/Colors.dart';

class FristPage extends StatelessWidget {
  const FristPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: 150, height: 150),
                  // Image(
                  //     image: AssetImage('assets/image1-removebg-preview.png')),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome to our app!',
                    style: GoogleFonts.saira(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textcolor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We are excited to help you stay up-to-date on your favorite sports.',
                    style: GoogleFonts.saira(color: AppColors.textcolor),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
