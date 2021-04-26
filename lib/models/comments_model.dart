import 'package:flutter/material.dart';

class Comments{

  final String username, userImage, commentBody;

  Comments({
    @required this.username,
    @required this.userImage,
    @required this.commentBody
  });

  static List<Comments> fetchAll(){ 
    return [
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
    ];

  }

}