import 'package:dio/dio.dart';
class ZYHttpConfig{

  static BaseOptions baseOptions = BaseOptions(baseUrl: baseUrl, connectTimeout: connectTimeout);
  static String baseUrl = "https://httpbin.org";
  static int connectTimeout = 5000;
}