import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_screen/Screens/home.dart';
import 'package:splash_screen/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          splash:
              // Icons.sports_football,
              // Text(
              //   "Sports App",
              //   style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.redAccent),
              // ),
              // Image.asset('images/R.png'),
              // duration: 2000,
              // splashTransition: SplashTransition.rotationTransition,
              // backgroundColor: Color.fromARGB(255, 30, 30, 55),
              //nextScreen: MyHomePage(title: 'GFG'),
              Column(
            children: [
              Image.asset('images/R.png',height: MediaQuery.of(context).size.height*.2,width: MediaQuery.of(context).size.width*.2),
              const Text(
                "Sports app",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

            ],
          ),
          backgroundColor: Color.fromARGB(255, 30, 30, 55),
          nextScreen: MyHomePage(title: 'GFG'),
          splashIconSize: 250,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
        ));

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: MediaQuery.of(context).size.height * .3,
    //         width: MediaQuery.of(context).size.width * .3,
    //         color: Colors.cyan,
    //       ),
    //       Container(
    //         child: Text(
    //           "Splash Screen",
    //           style: TextStyle(
    //             fontSize: 24,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),

    // );
  }
}
