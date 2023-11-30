import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.token);
  final String token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the token to the headers
    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }
}
