import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = "http://192.168.1.6:8080";

  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.post("$_baseUrl$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.put("$_baseUrl$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.delete("$_baseUrl$endPoint");
    return response.data;
  }
}
