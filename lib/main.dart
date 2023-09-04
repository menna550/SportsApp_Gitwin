import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Players/Players_cubit/players_cubit.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Screens/Lega/lega.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD
=======
import 'package:sports_app/Screens/Players_Screen/players.dart';
import 'package:sports_app/Screens/Players_Screen/test.dart';
import 'package:sports_app/Screens/Teams_Screen/Teams_Screen.dart';
>>>>>>> f42b9c9496e028d6e33781e0b8b590ed86250e82

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountriesCubit>(
          create: (BuildContext context) => CountriesCubit(),
        ),
<<<<<<< HEAD
        BlocProvider<PlayersCubit>(
          create: (BuildContext context) => PlayersCubit(),
=======
        BlocProvider<LocationCubitCubit>(
          create: (BuildContext context) => LocationCubitCubit(),
>>>>>>> 2081891541163ecba43a63e30bcaaf53ca9bb9d0
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
<<<<<<< HEAD

        /* home: showHome ? home_screen() : OnBoardingScreen(),*/
        home: Lega(),
=======
        home: showHome ? home_screen() : OnBoardingScreen(),
>>>>>>> f42b9c9496e028d6e33781e0b8b590ed86250e82
      ),
      
    );
  }
}
