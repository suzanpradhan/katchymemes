import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:katchymemes/repository/settings_repo.dart';
import 'package:katchymemes/screens/auth_screens/login_screen.dart';

class Settings {
  final String settingTitle;
  final IconData settingIcon;
  final Function onPress;

  Settings({
    required this.settingTitle,
    required this.settingIcon,
    required this.onPress,
  });
}

List<Settings> settingsData = [
  Settings(
      settingTitle: "General",
      settingIcon: (EvaIcons.settings),
      onPress: () {}),
  Settings(
      settingTitle: "Dark Mode", settingIcon: (EvaIcons.moon), onPress: () {}),
  Settings(
      settingTitle: "Notifications",
      settingIcon: (EvaIcons.archive),
      onPress: () {}),
  Settings(
      settingTitle: "Privacy Policy",
      settingIcon: (EvaIcons.lock),
      onPress: () {}),
  Settings(
      settingTitle: "Help and Support",
      settingIcon: (EvaIcons.alertCircle),
      onPress: () {}),
  Settings(
    settingTitle: "Log Out",
    settingIcon: (EvaIcons.logOut),
    onPress: SettingsRepo().logout,
  ),
];
