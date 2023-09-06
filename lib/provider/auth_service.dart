import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:my_verifications/Screens/userInformationScreen.dart';
// import 'package:flutter_navigation/flutter_navigation.dart';


class AuthService{
  signInWithGoogle()async{

    final GoogleSignInAccount?gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth =await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>userInformationScreen())
    // );
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
}