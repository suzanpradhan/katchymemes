import 'package:flutter/material.dart';
import 'package:katchymemes/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katchymemes',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
