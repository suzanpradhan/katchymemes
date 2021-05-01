import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white),
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Search"),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(icon: Icon(EvaIcons.searchOutline), onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
