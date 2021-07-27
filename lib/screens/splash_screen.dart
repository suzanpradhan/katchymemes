import 'dart:async';

import 'package:flutter/material.dart';
import 'package:katchymemes/screens/auth_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(
    //     Duration(seconds: 5),
    //     () => {
    //           Navigator.of(context)
    //               .push(MaterialPageRoute(builder: (BuildContext context) {
    //             return LoginScreen();
    //           }))
    //         });
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Text(
            "KatchyMemes",
            style: TextStyle(fontSize: 16),
          ),
        ),
      )),
    );
  }
}
