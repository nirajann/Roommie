import 'package:dio/dio.dart';
import 'package:roomfinding/data_source/remote_data_source/response/login_response.dart';
import 'package:roomfinding/data_source/remote_data_source/response/profile_response.dart';
import 'package:roomfinding/helper/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants.dart';
import '../../model/user.dart';

class UserRemoteDataSource {
  final Dio _httpservices = HttpServices().getDioInstance();

  Future<int> adduser(User user) async {
    try {
      Response response = await _httpservices.post(
        Constant.registerURL,
        data: {
          'Username': user.Username,
          'email': user.email,
          'password': user.password,
        },
      );

      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      Response response = await _httpservices.post(Constant.userLoginURL,
          data: {'Username': username, 'password': password});
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Constant.token = "bearer ${loginResponse.token!}";
        Constant.token = loginResponse.id!;
        addToken(loginResponse.token!);
        adduserid(loginResponse.id!);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<User>> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userid = pref.getString('_id')!;
    try {
      Response response = await _httpservices.get(
        '${Constant.getuser}/$userid',
      );
      List<User> lstUser = [];
      if (response.statusCode == 200) {
        ProfileResponse userResponse = ProfileResponse.fromJson(response.data);
        lstUser = userResponse.data!;
        return lstUser;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

   Future<int> updateUser(String username, String email,String pic) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userid = pref.getString('_id')!;
    try {
      Response response = await _httpservices.put(
        '${Constant.getuser}/$userid',
         data: {
          'Username': username,
          'email': email,
          'pic': pic
        },
      );
      if (response.statusCode == 200) {
          return 1;
      } else {
        return 0;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

void addToken(String token) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('token', "Bearer $token");

  // await pref.setString('login', token);
}

void adduserid(String userid) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('_id', userid);

  // await pref.setString('login', token);
}
