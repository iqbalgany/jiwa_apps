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

  Future<Map<String, dynamic>> pinLogin({
    required String token,
    required String email,
    required String pinCode,
  }) async {
    try {
      final response = await DioClient.instance.post(
        '/auth/pin-login',
        data: FormData.fromMap({
          'email': email,
          'pin_code': pinCode,
        }),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return {
        'status': 'error',
        'message': e.response?.data['message'] ?? 'Terjadi kesalahan',
      };
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String token,
    required String email,
    required String otp,
  }) async {
    try {
      final response = await DioClient.instance.post(
        '/auth/verify-otp',
        data: FormData.fromMap({
          'email': email,
          'otp': otp,
        }),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return {
        'status': 'error',
        'message': e.response?.data['message'] ?? 'Terjadi kesalahan',
      };
    }
  }

  Future<Map<String, dynamic>> registerUser({
    required String token,
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String region,
    required String job,
    required String phoneNumber,
    String? referralCode,
  }) async {
    try {
      final response = await DioClient.instance.post(
        '/auth/register',
        data: FormData.fromMap(
          {
            'name': name,
            'gender': gender,
            'date_of_birth': dateOfBirth,
            'email': email,
            'region': region,
            'job': job,
            'phone_number': phoneNumber,
            'referral_code': referralCode ?? '',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return {
        'status': 'error',
        'message': e.response?.data['message'] ?? 'Terjadi kesalahan',
      };
    }
  }
}
