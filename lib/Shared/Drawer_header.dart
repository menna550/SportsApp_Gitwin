import 'package:flutter/material.dart';
import 'package:sports_app/Shared/Colors.dart';

import 'Fonts.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryColor,
        height: MediaQuery.of(context).size.height * 1 / 3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.20,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/2.jpg',
                ),
                radius: 50,
              ),
            ),
            Text('Cristiano Ronaldo',
                style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: AppFonts.fontsize18,
                    fontWeight: FontWeight.w600)),
            Text('data',
                style: TextStyle(
                    fontSize: AppFonts.fontsize14, color: AppColors.textcolor)),
          ],
        ));
  }
}
