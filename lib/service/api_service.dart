import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_skinx/setting/contants.dart';

class ApiService {
  static late Dio client;
  BaseOptions options = BaseOptions(
    baseUrl: endPointAPI,
    connectTimeout: const Duration(seconds: 10),
    headers: {},
    contentType: Headers.formUrlEncodedContentType,
  );
  ApiService.initialize() {
    client = Dio(options);
  }

  static setHeaderToken(String token) {
    log("\n setHeaderToken => $token");
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    client.options.headers = headers;
  }

  static clearHeaderToken() {
    log("\n clearHeaderToken ");
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };
    client.options.headers = headers;
  }
}
