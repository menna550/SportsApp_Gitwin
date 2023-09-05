import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Players/Players_cubit/players_cubit.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Screens/Players_Screen/players.dart';
import 'package:sports_app/Screens/Players_Screen/test.dart';
import 'package:sports_app/Screens/Teams_Screen/Teams_Screen.dart';

import 'Data/Cubits/Teams_cubit/teams_cubit.dart';
import 'Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';

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

        BlocProvider<PlayersCubit>(
          create: (BuildContext context) => PlayersCubit(),),

        BlocProvider<LocationCubitCubit>(
          create: (BuildContext context) => LocationCubitCubit(),
        ),

        // BlocProvider<LocationCubitCubit>(
        //   create: (BuildContext context) => LocationCubitCubit(),
        // ),

        BlocProvider<TeamsCubit>(
          create: (BuildContext context) => TeamsCubit(),
        ),

        BlocProvider<TopScorersCubit>(
          create: (BuildContext context) => TopScorersCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Teams_Screen(),
        // home: showHome ? home_screen() : OnBoardingScreen(),
        // supportedLocales: [
        //   Locale('en'),
        //   Locale('ar'),
        // ],
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,

        // ],
      ),
      
    );
  }
}
