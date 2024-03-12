import 'dart:io';

import 'package:capstone_project_travel_ease/src/domain/requests/bodys/get_messages_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_help_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_forgot_password_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_send_Message_body.dart';
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

  @PUT('/user/updateuser?userid={userId}')
  Future updateUser(@Path() int userId, @Body() PutUpdateUserBody body);

  @Header('Content-Type multipart/form-data')
  @POST('/user/updateimage?userid={userId}')
  @MultiPart()
  Future updateImage(
    @Path('userId') int userId,
    @Part(name: 'image') File file,
  );

  @POST('/auth/forgetpassword')
  Future forgetPassWord(@Body() PostForgotPassWordBody body);

  @POST('/api/help/sendHelp')
  Future help(@Body() PostAddHelpBody body);

  @GET('/getChat')
  Future messages(@Body() GetMessageBody body);

  @POST('/sendChat')
  Future sendMessages(@Body() PostSendMessageBody body);
}
