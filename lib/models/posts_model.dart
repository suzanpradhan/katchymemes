import 'package:katchymemes/models/comments_model.dart';

class Post {
  String? username,
      postedDate,
      postImage,
      userImage,
      postText,
      likesCount,
      commentsCount;
  List<Comments>? comments;

  Post({
    this.username,
    this.userImage,
    this.postedDate,
    this.likesCount,
    this.commentsCount,
    this.postImage,
    this.postText,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['image_user_id'].toString(),
      userImage: json['user_image'].toString(),
      postedDate: json['image_date'].toString(),
      likesCount: json['image_likes'].toString(),
      commentsCount: json['comments_count'].toString(),
      postImage: json['image_path'],
      postText: json['captions'].toString(),
      comments: json['comments'],
    );
  }
}
