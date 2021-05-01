import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          // centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Add Post",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                  ),
                  onPressed: () {},
                  child: Text("Share")),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  scrollPhysics: BouncingScrollPhysics(),
                  maxLines: null,
                  style: TextStyle(color: Color(0xff0d0d0d), fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Please enter text here.",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              EvaIcons.image,
                              color: Color(0xff707070),
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon:
                                Icon(EvaIcons.video, color: Color(0xff707070)),
                            onPressed: () {})
                      ],
                    ),
                    IconButton(
                        icon: Icon(EvaIcons.moreHorizotnal,
                            color: Color(0xff707070)),
                        onPressed: () {})
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
