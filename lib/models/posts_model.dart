import 'package:katchymemes/models/comments_model.dart';
import 'package:katchymemes/utils/contants/api_constants.dart';

class Post {
  String? username,
      postedDate,
      postImage,
      userImage,
      postText,
      likesCount,
      commentsCount,
      userId;
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
    this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    // print(json["image_date"].toString() +
    //     json["image_path"].toString() +
    //     json['image_original_filename'].toString() +
    //     "===" +
    //     ApiConstants.imageUrl +
    //     (json["image_date"] as String).split(" ")[0].replaceAll("-", "/") +
    //     "/" +
    //     ((json["image_path"] != null) ? json["image_path"] + "/" : "") +
    //     json["image_name"] +
    //     "." +
    //     json["image_extension"]);
    return Post(
      username: (json['user_username'] != null)
          ? json['user_username'].toString()
          : "Guest",
      userImage: json['user_image'],
      postedDate: json['image_date'].toString(),
      likesCount: json['image_likes'].toString(),
      commentsCount: json['comments_count'].toString(),
      postImage: ApiConstants.imageUrl +
          (json["image_date"] as String).split(" ")[0].replaceAll("-", "/") +
          "/" +
          ((json["image_path"] != null) ? json["image_path"] + "/" : "") +
          json["image_name"] +
          "." +
          json["image_extension"],
      postText: json['image_name'].toString(),
      comments: json['comments'],
      userId: json['image_user_id'].toString(),
    );
  }
}
