import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_verifications/Screens/otp_screen.dart';
import 'package:my_verifications/Screens/register_screen.dart';
import 'package:my_verifications/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:safetynet_attestation/safetynet_attestation.dart';
// import com.google.firebase.FirebaseApp
// import com.google.firebase.appcheck.FirebaseAppCheck
// import com.google.firebase.appcheck.safetynet.SafetyNetAppCheckProviderFactory
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAppCheck.instance.activate();

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterScreen(),
      ),
    );
  }
}

