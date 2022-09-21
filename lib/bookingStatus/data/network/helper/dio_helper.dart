import 'package:dio/dio.dart';
import '../endpoints.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String token =
        'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
    required Map<String, dynamic> query,
  }) async {
    dio.options = BaseOptions(headers: {
      'token': token,
    });
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    String token =
        'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'token': token,
    };
    return dio.post(url, data: data);
  }
}
