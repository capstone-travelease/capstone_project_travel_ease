import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/user/signup')
  Future signUser(@Body() PostSignBody body);

  @POST('/user/login')
  Future loginUser(
      {@Field('email') required String email,
      @Field('password') required String password});
}
