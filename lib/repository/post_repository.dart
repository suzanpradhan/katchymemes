import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
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
      print(date);
      var sliceDate = date[0].replaceAll(RegExp(r'-'), '/');
      print(sliceDate);
      return listOfPost;
    } catch (e) {
      return Future.error("Memes Load Failed.");
    }
  }
}
