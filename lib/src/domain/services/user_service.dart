import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';

abstract interface class UserService {
  Future<UserModel> signUser({required PostSignBody body});
  Future<UserModel> loginUser(
      {required String email, required String password});
}
