import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    Key? key, 
    this.top, 
    this.left, 
    this.right, 
    this.bottom, 
    this.onTap, 
    this.imageUrl, 
    this.icon,
  }) : super(key: key);

  final double? top, left, right, bottom;
  final Function? onTap;
  final String? imageUrl;
  final EvaIconData? icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl!
            )
          ),
        ),
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: IconButton(
              icon: Icon(icon),
              onPressed: onTap as void Function()?,
            ),
          )
        )
      ],
    );
  }
}