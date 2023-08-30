import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Shared/Colors.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation_llwv7ick.json'),
                  // Image(
                  //     image: AssetImage('assets/image1-removebg-preview.png')),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'In our app you can',
                    style: GoogleFonts.saira(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textcolor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Follow your favorite teams and players,Watch live games,Read news,Get scores and stats.',
                      style: GoogleFonts.saira(color: AppColors.textcolor),
                      textAlign: TextAlign.center,
                    ),
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
