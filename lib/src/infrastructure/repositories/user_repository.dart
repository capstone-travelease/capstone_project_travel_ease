import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/client/user_client/user_client.dart';
import 'package:get/get.dart';

class UserRepository implements UserService {
  final _userClient = Get.find<UserClient>(tag: Constant.userClientTAG);
  @override
  Future<String> signUser({required PostSignBody body}) async {
    try {
      final res = await _userClient.signUser(body);
      if (res != null) {
        return res['message'];
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    try {
      final res = await _userClient.loginUser(email: email, password: password);
      if (res != null) {
        final data = UserModel.fromJson(res['data'] as Map<String, dynamic>);
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser({required int userId}) async {
    try {
      final res = await _userClient.getUser(userId);
      if (res != null) {
        final data = UserModel.fromJson(res['data'] as Map<String, dynamic>);
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updatePassWord(
      {required int userId, required PatchUpdatePassBody body}) async {
    try {
      final res = await _userClient.updatePassWord(userId, body);
      if (res != null) {
        return res['message'];
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateUser(
      {required int userId, required PutUpdateUserBody body}) async {
    try {
      final res = await _userClient.updateUser(userId, body);
      if (res != null) {
        return res['message'];
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }
}
