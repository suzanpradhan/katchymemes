import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=600"
                  )
                ),
              ),
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)     
                  ),
                  child: IconButton(
                    icon: Icon(EvaIcons.settingsOutline),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                    },
                  ),
                ),
              ),
            ]
          ),
        ],
    );
  }
}