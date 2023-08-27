import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        //solution for DioError [DioErrorType.response]: Http status error [429]
        connectTimeout: 100000,
        receiveTimeout: 100000,
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    @required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url!, queryParameters: query).catchError((error) {
      print(error.toString());
    });
  }
}
