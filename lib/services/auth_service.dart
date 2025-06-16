import 'package:dio/dio.dart';
import 'package:jiwa_apps/helpers/dio_client.dart';
import 'package:jiwa_apps/models/user_model..dart';
import 'package:jiwa_apps/services/storage_service.dart';

class AuthService {
  Future<Response> loginWithEmail(String email) async {
    try {
      final Response response =
          await DioClient.instance.post('/auth/login', data: {
        'email': email,
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> pinLogin({
    required String token,
    required String email,
    required String pinCode,
  }) async {
    try {
      final Response response = await DioClient.instance.post(
        '/auth/pin-login',
        data: {
          'email': email,
          'pin_code': pinCode,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final responseData = response.data;
      if (responseData['status '] == 'success' &&
          responseData['token'] != null) {
        await StorageService.saveToken(responseData['token']);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> verifyOtp({
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

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> registerUser({
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
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
        data: {
          'name': name,
          'gender': gender,
          'date_of_birth': dateOfBirth,
          'email': email,
          'region': region,
          'job': job,
          'phone_number': phoneNumber,
          'referral_code': referralCode ?? '',
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> creatPin({
    required String token,
    required String email,
    required String pinCode,
  }) async {
    try {
      final response = await DioClient.instance.post(
        '/auth/create-pin',
        data: {
          'email': email,
          'pin_code': pinCode,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final responseData = response.data;
      if (responseData['status'] == 'success' &&
          responseData['token'] != null) {
        await StorageService.saveToken(responseData['token']);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    final token = await StorageService.getToken();

    try {
      final response = await DioClient.instance.post(
        '/auth/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        await StorageService.removeToken();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> fetchUserProfile() async {
    final token = await StorageService.getToken();

    if (token == null) {
      throw Exception('Token tidak tersedia. Harap login kembali.');
    }

    try {
      final Response response = await DioClient.instance.get(
        '/auth/me',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final data = response.data['data'];
      if (data != null) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw Exception('Data pengguna tidak ditemukan dalam respons.');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  Future<Response> editProfile({
    String? name,
    String? gender,
    String? dateOfBirth,
    String? region,
    String? job,
    String? phoneNumber,
  }) async {
    final token = await StorageService.getToken();

    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (gender != null) data['gender'] = gender;
    if (dateOfBirth != null) data['date_of_birth'] = dateOfBirth;
    if (region != null) data['region'] = region;
    if (job != null) data['job'] = job;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;

    final response = await DioClient.instance.post(
      '/auth/edit-profile',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        'name': name,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'region': region,
        'job': job,
        'phone_number': phoneNumber,
      },
    );

    return response;
  }

  Future<Response> deleteAccount() async {
    final token = await StorageService.getToken();

    try {
      final response = await DioClient.instance.delete(
        '/auth/delete-account',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }

  Future<Response> sendOtpChangePin({required String email}) async {
    final token = await StorageService.getToken();

    try {
      final response = await DioClient.instance.post(
        '/auth/send-otp-change-pin',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'email': email,
        },
      );

      return response;
    } catch (e) {
      throw Exception('Failed to send otp: $e');
    }
  }

  Future<Response> verifyOtpChangePin({
    required String email,
    required String otp,
  }) async {
    final token = await StorageService.getToken();
    try {
      final response = await DioClient.instance.post(
        '/auth/verify-otp-change-pin',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'email': email,
          'otp': otp,
        },
      );

      return response;
    } catch (e) {
      throw Exception('Failed to verify otp: $e');
    }
  }

  Future<Response> changePin({
    required String email,
    required String newPinCode,
  }) async {
    final token = await StorageService.getToken();

    final response = await DioClient.instance.post(
      '/auth/change-pin',
      data: {
        'email': email,
        'new_pin_code': newPinCode,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }

  Future<Response> forgotPin(String email) async {
    final token = await StorageService.getToken();

    try {
      final response = await DioClient.instance.post(
        '/auth/forgot-pin',
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to forgot pin: $e');
    }
  }

  Future<Response> verifyOtpForgotPin({
    required String email,
    required String otp,
  }) async {
    final token = await StorageService.getToken();
    try {
      final response = await DioClient.instance.post(
        '/auth/verify-otp-reset-pin',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'email': email,
          'otp': otp,
        },
      );

      return response;
    } catch (e) {
      throw Exception('Failed to verify otp: $e');
    }
  }

  Future<Response> changeForgotPin({
    required String email,
    required String newPinCode,
  }) async {
    final token = await StorageService.getToken();

    final response = await DioClient.instance.post(
      '/auth/reset-pin',
      data: {
        'email': email,
        'new_pin_code': newPinCode,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }
}
