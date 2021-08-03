import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    this.username,
    this.time,
    this.imageUrl,
    this.likeCount,
    this.commentCount,
    this.userImage,
    this.onPress,
    this.onShare,
  }) : super(key: key);

  final String? username, time, imageUrl, userImage, likeCount, commentCount;
  final Function? onPress, onShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 14, 18, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0xfff1f1f1),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: PostHeader(
                  userImage: userImage, username: username, time: time),
            ),
            GestureDetector(
              onTap: onPress as void Function()?,
              child: Container(
                child: Image(
                  image: (imageUrl != "" && imageUrl != null)
                      ? NetworkImage(imageUrl!.toString())
                      : AssetImage("assets/images/no_profile.png")
                          as ImageProvider,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(EvaIcons.heartOutline),
                            onPressed: () {
                              print("write like function");
                            }),
                        Text(
                          "$likeCount",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(EvaIcons.messageSquareOutline),
                            onPressed: () {
                              print("write comment function");
                            }),
                        Text(
                          "$commentCount",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(EvaIcons.cloudDownloadOutline),
                            onPressed: () {
                              print("write download function");
                            }),
                        Text(
                          "$likeCount",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(EvaIcons.shareOutline),
                          onPressed: onShare as void Function(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    this.userImage,
    this.username,
    this.time,
  }) : super(key: key);

  final String? userImage;
  final String? username;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: (userImage != null && userImage != "")
              ? NetworkImage(userImage.toString())
              : AssetImage("assets/images/no_profile.png") as ImageProvider,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () {},
                child: Text(
                  "Follow",
                  style: TextStyle(color: Colors.white),
                )),
            IconButton(
              icon: Icon(
                EvaIcons.moreVerticalOutline,
                size: 20,
              ),
              onPressed: () {
                print("write option function");
              },
            )
          ],
        )
      ],
    );
  }
}
