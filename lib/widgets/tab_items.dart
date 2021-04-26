import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    this.color,
    @required this.title,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}

