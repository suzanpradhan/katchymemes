import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/screens/home.dart';
import 'package:katchymemes/widgets/custom_stack.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  DetailScreen(this.post);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomStack(
              imageUrl: post.postImage,
              left: 20.0,
              top: 20.0,
              icon: EvaIcons.arrowIosBackOutline as EvaIconData,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(post.userImage!),
                ),
                title: Text(post.username!),
                subtitle: Text(post.postedDate!),
                trailing: TextButton(
                  child: Text("Follow"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    primary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    print("follow");
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              width: size.width,
              child: Text(
                post.postText!,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Text(
                "Comments",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: post.comments!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    post.comments![index].userImage),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text:
                                          post.comments![index].username + " ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: post
                                                .comments![index].commentBody,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black87)),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
