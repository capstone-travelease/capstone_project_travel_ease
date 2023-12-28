import 'dart:io';

import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';

abstract interface class UserService {
  Future<String> signUser({required PostSignBody body});

  Future<UserModel> loginUser(
      {required String email, required String password});

  Future<UserModel> getUser({required int userId});

  Future<String> updatePassWord(
      {required int userId, required PatchUpdatePassBody body});

  Future<String> updateUser(
      {required int userId, required PutUpdateUserBody body});

  Future<String> updateImage({required int userId, required File file});
}
