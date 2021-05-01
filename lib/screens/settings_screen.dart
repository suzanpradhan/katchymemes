import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(EvaIcons.arrowIosBack),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white30,
          elevation: 0,
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: settingsData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            settingsData[index].settingIcon,
                            size: 24,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            settingsData[index].settingTitle,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
