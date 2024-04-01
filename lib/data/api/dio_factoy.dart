import 'package:dio/dio.dart';

class DioFactory {
  static Dio instance({required String baseUrl}) {
    final dio = Dio(_options(baseUrl));
    return dio;
  }

  static BaseOptions _options(String baseUrl) => BaseOptions(baseUrl: baseUrl);
}
