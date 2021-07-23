import 'package:flutter/material.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/screens/details_screen.dart';
import 'package:katchymemes/widgets/post_card.dart';

class ProfilePostScreens extends StatefulWidget {
  @override
  _ProfilePostScreensState createState() => _ProfilePostScreensState();
}

class _ProfilePostScreensState extends State<ProfilePostScreens> {
  @override
  Widget build(BuildContext context) {
    return Text("data");
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemCount: posts.length,
    //   itemBuilder: (context, index) {
    //     return PostCard(
    //       username: posts[index].username,
    //       userImage: posts[index].userImage,
    //       time: posts[index].postedDate,
    //       imageUrl: posts[index].postImage,
    //       likeCount: posts[index].likesCount,
    //       commentCount: posts[index].commentsCount,
    //       onPress: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => DetailScreen(posts[index])));
    //       },
    //     );
    //   },
    // );
  }
}
