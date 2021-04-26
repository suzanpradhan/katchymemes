import 'package:flutter/material.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/widgets/post_card.dart';

class RecentTab extends StatefulWidget {
  @override
  _RecentTabState createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {

  final posts = Post.fetchAll();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index){
        return PostCard(
          username: posts[index].username,
          userImage: posts[index].userImage,
          time: posts[index].postedDate,
          imageUrl: posts[index].postImage,
          likeCount: posts[index].likesCount,
          commentCount: posts[index].commentsCount,
        );
      },
    );
  }
}
