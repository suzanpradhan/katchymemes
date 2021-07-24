import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:katchymemes/screens/auth_screens/login_screen.dart';

class SettingsRepo {
  logout(context) {
    Hive.box('login').deleteFromDisk();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
