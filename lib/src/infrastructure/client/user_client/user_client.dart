import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/auth/signup')
  Future signUser(@Body() PostSignBody body);

  @POST('/auth/login')
  Future loginUser(
      {@Field('email') required String email,
      @Field('password') required String password});

  @GET('/user/getuser?userid={userId}')
  Future getUser(@Path('userId') int userId);

  @PATCH('/auth/changepassword/{userId}')
  Future updatePassWord(
      @Path('userId') int userId, @Body() PatchUpdatePassBody body);

  @PUT('/user/updateuser/17')
  Future updateUser(@Path() int userId, @Body() PutUpdateUserBody body);
}
