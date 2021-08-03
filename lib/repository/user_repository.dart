import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:katchymemes/utils/contants/api_constants.dart';

class UserRepository {
  getUserDetails(userId) async {
    try {
      var dio = new Dio();
      var apiUrl = ApiConstants.baseUrl +
          ApiConstants.userDetailUrl +
          "key=" +
          ApiConstants.apiKey +
          "&user_id=" +
          userId;
      var response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(
            jsonDecode(response.toString())["success"]["data"]);
        // UserModel data = json.decode(response.data["success"]["data"]);
        return userModel;
      } else {
        return Future.error("Error loading user data");
      }
    } catch (e) {
      print(e.toString());
      return Future.error("Couldnot load user data");
    }
  }

  Future<List<Post>> getUserPosts(String userId) async {
    try {
      final apiUrl = ApiConstants.baseUrl +
          ApiConstants.userPostsUrl +
          "key=" +
          ApiConstants.apiKey + "&user_id=" + userId;

      List<Post> listOfPost = [];

      var uri = Uri.parse(apiUrl);
      var response = await http.get(uri);
      List result = json.decode(response.body)["success"]["data"];

      listOfPost = result.map((data) => Post.fromJson(data)).toList();
      // var date = listOfPost[0].postedDate!.split(" ");
      // var sliceDate = date[0].replaceAll(RegExp(r'-'), '/');
      
      return listOfPost;
    } catch (e) {
      return Future.error("Memes Load Failed.");
    }
  }
}
