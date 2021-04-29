import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key, 
    this.username, 
    this.time, 
    this.imageUrl, 
    this.likeCount, 
    this.commentCount, 
    this.userImage, 
    this.onPress,
  }) : super(key: key);

  final String username, time, imageUrl, userImage;
  final int likeCount, commentCount;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Card(
          elevation: 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: PostHeader(userImage: userImage, username: username, time: time),
                ),
                GestureDetector(
                  onTap: onPress,
                  child: Container(
                    child: Image(
                      image: NetworkImage(
                        imageUrl
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(EvaIcons.heartOutline), 
                        onPressed: (){
                          print("write like function");
                        }
                      ),
                      Text(
                        "$likeCount",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(EvaIcons.messageSquareOutline), 
                        onPressed: (){
                          print("write comment function");
                        }
                      ),
                      Text(
                        "$commentCount",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(EvaIcons.cloudDownloadOutline), 
                        onPressed: (){
                          print("write download function");
                        }
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(EvaIcons.shareOutline), 
                        onPressed: (){
                          print("write share function");
                        }
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
    Key key,
    @required this.userImage,
    @required this.username,
    @required this.time,
  }) : super(key: key);

  final String userImage;
  final String username;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            userImage
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(EvaIcons.moreVerticalOutline), 
          onPressed: (){
            print("write option function");
          },
        )
      ],
    );
  }
}