// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';

// import '../main.dart';
// // import 'home.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();

// }

// class _SplashState extends State<Splash> {
//   void initState() {
//     super.initState();
//     _navigatehome();
//   }

//   _navigatehome() async {
//     await Future.delayed(Duration(milliseconds: 1500), () {});
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

// }

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';

import 'Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   navigateToOnboarding();
  // }

  bool isFirstRun = true;

  @override
  void initState() {
    super.initState();
    navigateToOnboarding();
    // Check if it is the first run of the app
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        isFirstRun = prefs.getBool('isFirstRun') ?? true;
      });
    });
  }

  void navigateToOnboarding() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          SizedBox(height: 14),
          Image.asset('assets/sport time app.png',
              height: MediaQuery.of(context).size.height * .23,
              width: MediaQuery.of(context).size.width * .50),
          SizedBox(height: 25),
          // const Text(
          //   "Sport Time",
          //   style: TextStyle(
          //       fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 30, 30, 55),
      nextScreen: isFirstRun ? OnBoardingScreen() : home_screen(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }

  // static Future check() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isFirstRun = prefs.getBool('firstRun') ?? true;

  //   runApp(MyApp(isFirstRun: isFirstRun));
  //   // WidgetsFlutterBinding.ensureInitialized();
  //   // final prefs = await SharedPreferences.getInstance();
  //   // final showHome = prefs.getBool('showHome') ?? false;
  //   // runApp(MyApp(showHome: showHome));
  // }
}
