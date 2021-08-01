import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:katchymemes/models/user_model.dart';
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
}
