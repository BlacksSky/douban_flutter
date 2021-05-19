import 'package:dio/dio.dart';
import 'config.dart';

enum HttpMethod { post, get }

class ZYHttpRequest {
  static final Dio dio = Dio(ZYHttpConfig.baseOptions);

  static Future<T> request<T>(String url,
      {Map<String, dynamic> params,
      HttpMethod method = HttpMethod.get,
      Interceptor interceptor}) async {
    String methodString = "post";
    if (method == HttpMethod.get) {
      methodString = "get";
    }
    final options = Options(method: methodString);

    addInterceptor();

    Map<String, dynamic> allParams = ZYHttpConfig.baseParams;
    if(params != null){
      allParams.addAll(params);
    }

    try {
      print("url:$url,params:${allParams}");
      Response response =
          await dio.request(url, queryParameters: allParams, options: options);
      return response.data;
    } on DioError catch (error) {
      return Future.error(error);
    }
  }

  //  添加拦截器
  static void addInterceptor({Interceptor interceptor}) {
    Interceptor baseInterceptor = InterceptorsWrapper(onRequest: (options) {
      print("请求拦截");
      return options;
    }, onResponse: (response) {
      print("响应拦截");
      return response;
    }, onError: (err) {
      print("错误拦截");
      return err;
    });

    List<Interceptor> interceptors = [baseInterceptor];
    if (interceptor != null) {
      interceptors.add(interceptor);
    }
    dio.interceptors.addAll(interceptors);
  }
}
