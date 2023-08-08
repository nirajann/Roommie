import 'package:roomfinding/app/networkconenctivity.dart';
import 'package:roomfinding/data_source/local_data_source/user_data_source.dart';
import 'package:roomfinding/data_source/remote_data_source/user_data_source.dart';

import '../model/user.dart';

abstract class Userrepository {
  Future<int> registeruser(User user);
  Future<bool> loginUser(String username, String password);
  Future<List<User>> getUser();
  Future<int> updateUser(String username, String email, String pic);
}

class Userrepositoryimp extends Userrepository {
  @override
  Future<int> registeruser(User user) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().adduser(user);
    } else {
      return UserDataSource().registeruser(user);
    }
  }

  @override
  Future<bool> loginUser(String username, String password) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().loginUser(username, password);
    } else {
      await UserDataSource().loginStudent(username, password);
      return true;
    }
  }

  @override
  Future<List<User>> getUser() async {
    bool status = true;
    List<User> lsthostel = [];
    if (status) {
      lsthostel = await UserRemoteDataSource().getUser();
      return lsthostel;
    }
  }

  @override
  Future<int> updateUser(String username, String email, String pic) async {
    bool status = true;
    int lsthostel = 2;
    if (status) {
      lsthostel = await UserRemoteDataSource().updateUser(username, email, pic);
      return lsthostel;
    }
  }
}
