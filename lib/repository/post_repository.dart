import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/utils/contants/api_constants.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    try {
      final apiUrl = ApiConstants.baseUrl +
          ApiConstants.postsUrl +
          "key=" +
          ApiConstants.apiKey;

      List<Post> listOfPost = [];

      var uri = Uri.parse(apiUrl);
      var response = await http.get(uri);
      List result = json.decode(response.body)["success"]["data"];

      listOfPost = result.map((data) => Post.fromJson(data)).toList();
      var date = listOfPost[0].postedDate!.split(" ");
      var sliceDate = date[0].replaceAll(RegExp(r'-'), '/');
      return listOfPost;
    } catch (e) {
      return Future.error("Memes Load Failed.");
    }
  }

  Future<bool> addPost(
      {required File image, String? username, String description = ""}) async {
    try {
      var dio = Dio();
      var apiUrl = ApiConstants.baseUrl + ApiConstants.postsPostUrl;
      Map<String, dynamic> dataToUpload = {
        'key': ApiConstants.apiKey,
        'source': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
        'description': description
      };
      if (username != null) {
        dataToUpload["user"] = username;
      }
      var formData = FormData.fromMap(dataToUpload);
      var response = await dio.post(apiUrl, data: formData);
      Map decodedResponse = json.decode(response.toString());
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        if (decodedResponse["error"]["message"] != null) {
          return Future.error(decodedResponse["error"]["message"]);
        } else {
          return Future.error("Memes Upload Failed.1");
        }
      } else {
        return Future.error("Memes Upload Failed.2");
      }
    } catch (e) {
      return Future.error("Memes Upload Failed.3");
    }
  }

  
}
