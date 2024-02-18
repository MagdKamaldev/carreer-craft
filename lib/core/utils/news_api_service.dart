import 'package:dio/dio.dart';

class NewsApiServices {
  final String baseUrl = "https://newsapi.org/v2/top-headlines";

  final Dio _dio;
  NewsApiServices(this._dio);

  Future<Response> getData({
    required Map<String, dynamic> query,
  }) async {
    return await _dio.get(
      baseUrl,
      queryParameters: query,
    );
  }
}
