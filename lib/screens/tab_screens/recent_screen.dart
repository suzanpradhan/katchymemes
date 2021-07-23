import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/utils/contants/api_constants.dart';
import 'package:katchymemes/widgets/post_card.dart';
import 'package:http/http.dart' as http;
import '../details_screen.dart';

class RecentTab extends StatefulWidget {
  @override
  _RecentTabState createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final apiUrl = ApiConstants.baseUrl +
      ApiConstants.postsUrl +
      "key=" +
      ApiConstants.apiKey;

  List<Post> listOfPost = [];

  Future fetchPosts() async {
    var uri = Uri.parse(apiUrl);
    var response = await http.get(uri);
    List result = json.decode(response.body)["success"]["data"];
    listOfPost = result.map((data) => Post.fromJson(data)).toList();
    var date = listOfPost[0].postedDate!.split(" ");
    print(date);
    var sliceDate = date[0].replaceAll(RegExp(r'-'), '/');
    print(sliceDate);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: listOfPost.length,
      itemBuilder: (context, index) {
        return PostCard(
          username: listOfPost[index].username,
          userImage: listOfPost[index].userImage,
          time: listOfPost[index].postedDate,
          imageUrl: listOfPost[index].postImage,
          likeCount: listOfPost[index].likesCount,
          commentCount: listOfPost[index].commentsCount,
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(listOfPost[index])));
          },
        );
      },
    );
  }
}
