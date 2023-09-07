import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// import 'package:sports_app/Data/Players/Players_cubit/players_cubit.dart';
import 'package:sports_app/Screens/Countries%20Screen/Countries_Screen.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Screens/Lega/lega.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Screens/Players_Screen/players.dart';
import 'package:sports_app/Screens/Players_Screen/test.dart';
import 'package:sports_app/Screens/Register_Screen.dart';
import 'package:sports_app/Screens/Splash_Screen.dart';
import 'package:sports_app/Screens/Teams_Screen/Teams_Screen.dart';
import 'package:sports_app/Screens/Teams_Screen/try.dart';

import 'Data/Cubits/Lega_cubit/get_lega_cubit.dart';
import 'Data/Cubits/Players_cubit/players_cubit.dart';
//import 'Data/Cubits/Teams_Cubit/teams_cubit.dart';
import 'Data/Cubits/cubit/teams_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountriesCubit>(
          create: (BuildContext context) => CountriesCubit(),
        ),
        BlocProvider<PlayersCubit>(
          create: (BuildContext context) => PlayersCubit(),
        ),
        BlocProvider<LocationCubitCubit>(
          create: (BuildContext context) => LocationCubitCubit(),
        ),
        BlocProvider<TeamsCubit>(
          create: (BuildContext context) => TeamsCubit(),
        ),
        BlocProvider<TopScorersCubit>(
          create: (BuildContext context) => TopScorersCubit(),
        ),
        BlocProvider<GetLegaCubit>(
          create: (BuildContext context) => GetLegaCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sport Time',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
