import 'dart:convert';
import 'dart:developer';

import 'package:beegains/model/login_model.dart';
import 'package:dio/dio.dart';

import '../model/model.dart';

class ApiServices {
  static Dio dio = Dio();
  Future<LoginModel?> loginApi(String username, String password) async {
    try {
      Response response = await dio.post(
        'http://143.110.181.12:7070/api/login',
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final jsonresponse = json.encode(response.data);
        return loginModelFromJson(jsonresponse);
      }
    } on DioException catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<UserModel?> getapi(String token) async {
    try {
      Response response = await dio.get(
        'http://143.110.181.12:7070/api/get_enquiries?page=1&franchise_id=2&search=""&from_date=""&to_date=""&est_status=""&jobcards=0',
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final jsonresponse = json.encode(response.data);
        return userModelFromJson(jsonresponse);
      }
    } on DioException catch (e) {
      print(e.toString());
    }
    return null;
  }
}
