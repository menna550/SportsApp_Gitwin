import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Shared/Colors.dart';
import 'package:sports_app/Shared/Fonts.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                  Lottie.asset('assets/animation_llwv7ick.json',
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.height * 0.25),
                  // Image(
                  //     image: AssetImage('assets/image1-removebg-preview.png')),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'In our app you can',
                    style: GoogleFonts.saira(
                        fontSize: AppFonts.fontsize24,
                        fontWeight: AppFonts.fontWeight700,
                        color: AppColors.textcolor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Follow your favorite teams and players,Watch live games,Read news,Get scores and stats.',
                      style: GoogleFonts.saira(color: AppColors.textcolor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
