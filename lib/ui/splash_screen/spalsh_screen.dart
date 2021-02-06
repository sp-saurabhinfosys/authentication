import 'dart:async';

import 'package:authentication/functionality/fun_phone_authentication.dart';
import 'package:authentication/ui/phone_authentication.dart';
import 'package:flutter/material.dart';
import 'package:authentication/functionality/fun_firebase_messaging.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  gotoNext()
  {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyLogin())));
  }
  getMyToken()
  async {
    FunFirebaseMessaging.getToken();
    await gotoNext();
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Image.network("https://firebase.google.com/downloads/brand-guidelines/PNG/logo-standard.png"),
        ),
      ),
    );
  }
}
