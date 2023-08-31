import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Screens/OnBoardingScreen/On_Boarding_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: showHome ? home_screen() : OnBoardingScreen(),
      ),
      //home: showHome ? home_screen() : OnBoardingScreen(),
    );
  }
}
