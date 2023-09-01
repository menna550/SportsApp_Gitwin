import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:sports_app/Shared/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => OnBoardingScreen(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: AppColors.primaryColor,
      ),
    );
  }
}
