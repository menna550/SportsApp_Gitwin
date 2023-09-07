import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Screens/Home_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isFirstRun = true;

  @override
  void initState() {
    super.initState();
    // Check if it is the first run of the app
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        isFirstRun = prefs.getBool('isFirstRun') ?? true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Set isFirstRun to false so that the onboarding screen will not be shown again
          SharedPreferences.getInstance().then((prefs) {
            prefs.setBool('isFirstRun', false);
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  isFirstRun ? RegisterScreen() : home_screen(),
            ),
          );
        },
        child: Text('next'));
  }
}
