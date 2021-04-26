import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

class Settings{

  final String settingTitle;
  final IconData settingIcon;
  
  Settings({
    @required this.settingTitle,
    @required this.settingIcon,
  });

}

List<Settings> settingsData = [
  Settings(
    settingTitle: "General", 
    settingIcon: (EvaIcons.settings),
  ),
  Settings(
    settingTitle: "Dark Mode", 
    settingIcon: (EvaIcons.moon),
  ),
  Settings(
    settingTitle: "Notifications", 
    settingIcon: (EvaIcons.archive)
  ),
  Settings(
    settingTitle: "Privacy Policy", 
    settingIcon: (EvaIcons.lock)
  ),
  Settings(
    settingTitle: "Help and Support", 
    settingIcon: (EvaIcons.alertCircle)
  ),
  Settings(
    settingTitle: "Log Out", 
    settingIcon: (EvaIcons.logOut)
  ),
];