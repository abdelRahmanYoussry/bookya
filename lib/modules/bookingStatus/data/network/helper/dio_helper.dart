import 'package:dio/dio.dart';
import '../endpoints.dart';

class FinalDioHelper {
  static  Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    String token = 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
      Map<String, dynamic> ?query,
  }) async {
    dio?.options = BaseOptions(headers: {
      'token':token,
      // 'Host':'<calculated when request is sent>',
      // 'User-Agent':'PostmanRuntime/7.29.2',
      // 'Accept':'*/*',
      // 'Accept-Encoding':'gzip, deflate, br',
      // 'Connection': 'keep-alive',
    });
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Future<Response>?> postData({
    String token =
        'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'token': token,
    };
    return dio!.post(url, data: data);
  }
}
