import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<dynamic> get({required String endpoint}) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
