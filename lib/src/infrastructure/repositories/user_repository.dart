import 'dart:io';

import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/messages_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/get_messages_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_help_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_forgot_password_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_send_Message_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/base/user_client/user_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;

class UserRepository implements UserService {
  final _userClient = get_x.Get.find<UserClient>(tag: Constant.userClientTAG);
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

  @override
  Future<String> updateImage({required int userId, required File file}) async {
    try {
      final filed = await MultipartFile.fromFile(file.path);
      Dio().options.headers["Content-Type"] = "multipart/form-data";
      final res = await Dio().post(
        'http://34.142.198.2:3634/user/updateimage?userid=$userId',
        data: FormData.fromMap({'image': filed}),
      );
      return res.toString();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> help({required PostAddHelpBody body}) async {
    try {
      final res = await _userClient.help(body);
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
  Future<String> forgetPassWord({required PostForgotPassWordBody body}) async {
    try {
      final res = await _userClient.forgetPassWord(body);
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
  Future<List<MessagesModel>> messages({required GetMessageBody body}) async {
    try {
      final res = await _userClient.messages(body);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => MessagesModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendMessage({required PostSendMessageBody body}) async {
    try {
      final res = await _userClient.sendMessages(body);
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
