import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Shared/Colors.dart';

class TopScorersButtons extends StatefulWidget {
  const TopScorersButtons({super.key});

  @override
  State<TopScorersButtons> createState() => _TopScorersButtonsState();
}

class _TopScorersButtonsState extends State<TopScorersButtons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: ListView.builder(
            // separatorBuilder: (context, index) {
            //   return Divider(
            //     color: AppColors.secondaryColor,
            //     height: 2,
            //     thickness: 2,
            //   );
            // },
            itemCount: 11,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                //padding: const EdgeInsets.only(bottom: 10.0),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.secondaryColor),
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/RealMadried.com.png"),
                  ),
                  title: Text(
                    'Cristiano Ronaldo',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'age : 37',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ));
            }),
          )),
    );
  }
}
