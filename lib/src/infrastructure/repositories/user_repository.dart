import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/user_client/user_client.dart';
import 'package:get/get.dart';

class UserRepository implements UserService {
  final _client = Get.find<UserClient>(tag: Constant.userClientTAG);
  @override
  Future<String> signUser({required PostSignBody body}) async {
    try {
      final res = await _client.signUser(body);
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
      final res = await _client.loginUser(email: email, password: password);
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
}
