import 'dart:developer';

import 'package:blwm_app/services/auth.dart';
import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio(BaseOptions(

      //alacrity
      // baseUrl: 'http://192.168.10.102:8080/api/',

      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,

      //android mi1
      // baseUrl: 'http://192.168.33.160:8080/api/',
      baseUrl:
          'http://masterprojectprod-env.eba-usswj6bx.eu-west-2.elasticbeanstalk.com/api/',
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
      }));

  // ignore: avoid_single_cascade_in_expression_statements
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        requestInterceptor(options);
        return handler.next(options);
      },
    ),
  );

  return dio;
}

dynamic requestInterceptor(RequestOptions options) async {
  if (options.headers.containsKey('auth')) {
    var token = await Auth().getToken();

    log(token);

    options.headers.addAll({'Authorization': 'Bearer $token'});
  }
}
