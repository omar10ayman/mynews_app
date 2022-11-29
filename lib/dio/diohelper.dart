import 'package:dio/dio.dart';

// ignore: camel_case_types
class dioHelper {
  static Dio? dio;
  static intHelper() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response?> getApi({
    required String path,
    required Map<String, dynamic> q,
  }) async {
    return await dio?.get(path, queryParameters: q);
  }
}
