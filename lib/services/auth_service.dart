import 'package:dio/dio.dart';
import 'package:jiwa_apps/helpers/dio_client.dart';

class AuthService {
  Future<Map<String, dynamic>> loginWithEmail(String email) async {
    try {
      final response = await DioClient.instance.post('/auth/login', data: {
        'email': email,
      });

      return {
        'success': true,
        'message': response.data['message'],
        'is_registered': response.data['is_registered'],
      };
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? 'Terjadi kesalahan',
      };
    }
  }
}
