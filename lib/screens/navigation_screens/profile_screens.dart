import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/screens/settings_screen.dart';
import 'package:katchymemes/widgets/custom_stack.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            CustomStack(
              top: 20.0,
              right: 20.0,
              imageUrl: "https://images.pexels.com/photos/844297/pexels-photo-844297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              icon: EvaIcons.settingsOutline,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            Positioned(
              bottom: -10,
              child: Stack(
                children: [
                  Positioned(
                    top: -20.0,
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: CachedNetworkImageProvider(
                        "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                      ),
                    )
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0)
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("bishal_magar")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}