import 'package:get/get.dart';
import 'package:jiwa_apps/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  String email = '';
  bool isLoading = false;
  bool isRegistered = false;
  String message = '';

  Future<void> loginwithEmail(String email, Function onSuccess) async {
    isLoading = true;
    update();

    final result = await _authService.loginWithEmail(email);

    isLoading = false;
    message = result['message'];

    if (result['message']) {
      isRegistered = result['is_registered'];
      update();
      onSuccess();
    } else {
      Get.snackbar('Login Gagal', message);
      update();
    }
  }
}
