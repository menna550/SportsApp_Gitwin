import 'package:flutter/material.dart';
import 'package:sports_app/Screens/Home_Screen.dart';

import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _onboardingShown = false;

  @override
  void initState() {
    super.initState();
    // Check if the onboarding screen has been shown before.
    SharedPreferences.getInstance().then((prefs) {
      _onboardingShown = prefs.getBool('onboardingShown') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingScreen(),
    );
    // if (!_onboardingShown) {
    //   // Show the onboarding screen.s
    //   return OnBoardingScreen();
    // } else {
    //   // Go directly to the main app screen.
    //   return HomeScreen();
    // }
  }
}
