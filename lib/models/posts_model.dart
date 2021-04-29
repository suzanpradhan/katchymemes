import 'package:flutter/material.dart';
import 'package:katchymemes/models/comments_model.dart';

class Post{

  String username, postedDate, postImage, userImage, postText;
  int likesCount, commentsCount;
  List<Comments> comments;

  Post({
    @required this.username,
    @required this.userImage,
    @required this.postedDate,
    @required this.likesCount,
    @required this.commentsCount,
    @required this.postImage,
    this.postText,
    this.comments
  });

  static List<Post> fetchAll(){
    return [
      Post(
        username: "bishal_magar", 
        userImage: "https://images.pexels.com/photos/38275/anonymous-studio-figure-photography-facial-mask-38275.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
        postedDate: "20min", 
        likesCount: 400, 
        commentsCount: 90,
        postImage: "https://images.pexels.com/photos/844297/pexels-photo-844297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        postText: "This is bishal_magar",
        comments: <Comments>[
          Comments(
            username: "suzan_pradhan", 
            userImage: "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow hululu hoalalal koala xin fu xu li ni ma fasdfas dsfad"
          ),
          Comments(
            username: "dips_gupts", 
            userImage: "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow great vary noice"
          ),
        ]
      ),
      Post(
        username: "suzan_pradhan", 
        userImage: "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
        postedDate: "15min", 
        likesCount: 300, 
        commentsCount: 60,
        postImage: "https://images.pexels.com/photos/2559941/pexels-photo-2559941.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        postText: "This is suzan_pradhan",
        comments: <Comments>[
          Comments(
            username: "suzan_pradhan", 
            userImage: "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow hululu hoalalal koala xin fu xu li ni ma"
          ),
          Comments(
            username: "dips_gupts", 
            userImage: "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow great vary noice"
          ),
        ]
      ),
      Post(
        username: "deeps_gupts", 
        userImage: "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
        postedDate: "10min", 
        likesCount: 230, 
        commentsCount: 50,
        postImage: "https://images.pexels.com/photos/3586966/pexels-photo-3586966.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        postText: "This is deeps_gupts",
        comments: <Comments>[
          Comments(
            username: "suzan_pradhan", 
            userImage: "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow hululu hoalalal koala xin fu xu li ni ma"
          ),
          Comments(
            username: "dips_gupts", 
            userImage: "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
            commentBody: "wow great vary noice"
          ),
        ]
      ),
    ];
  }

}

