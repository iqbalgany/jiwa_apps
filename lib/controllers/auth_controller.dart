import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/models/user_model..dart';
import 'package:jiwa_apps/screens/authentication/input_pin_screen.dart';
import 'package:jiwa_apps/screens/authentication/login_screen.dart';
import 'package:jiwa_apps/screens/authentication/registration_form_screen.dart';
import 'package:jiwa_apps/services/auth_service.dart';
import 'package:jiwa_apps/services/storage_service.dart';
import 'package:jiwa_apps/widgets/nav_bar.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final TextEditingController referralCodeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController citizenshipController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<TextEditingController> get pinController => _pinController;

  String email = '';
  String message = '';
  String? errorMessage;
  String token = '';
  bool isLoading = false;
  bool isRegistered = false;
  bool isChecked = false;
  String selectedNationality = '';
  String selectedJob = '';
  int? selectedGender = 0;
  UserModel? _user;

  UserModel? get user => _user;

  final Map<int, String> genderLabels = {
    0: 'Male',
    1: 'Female',
  };

  final List<String> countries = [
    'Indonesia',
    'Singapore',
    'Malaysia',
    'Vietnam',
    'Thailand',
    'Other',
  ];

  final List<String> jobs = [
    'Enterpreneur',
    'Pelajar / Mahasiswa',
    'Karyawan Swasta',
    'Pegawai Negeri Sipil',
    'Ibu Rumah Tangga',
    'Lainnya',
  ];

  final List<TextEditingController> _otpController =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _otpFocusNode =
      List.generate(4, (index) => FocusNode());

  final List<TextEditingController> _pinController =
      List.generate(6, (_) => TextEditingController());

  final List<FocusNode> _pinFocusNode = List.generate(6, (_) => FocusNode());

  List<FocusNode> get pinFocusNode => _pinFocusNode;

  String get fullPin => _pinController.map((e) => e.text).join();

  TextEditingController get emailController => _emailController;
  set emailController(TextEditingController controller) {
    _emailController.text = controller.text;
  }

  List<FocusNode> get otpFocusNode => _otpFocusNode;
  set otpFocusNode(List<FocusNode> nodes) {
    if (nodes.length == 4) {
      for (int i = 0; i < 4; i++) {
        _otpFocusNode[i] = nodes[i];
      }
    }
  }

  List<TextEditingController> get otpController => _otpController;
  set otpController(List<TextEditingController> controllers) {
    if (controllers.length == 4) {
      for (int i = 0; i < 4; i++) {
        _otpController[i].text = controllers[i].text;
      }
    }
  }

  @override
  void onClose() {
    for (final controller in _pinController) {
      controller.dispose();
    }

    for (final focusNode in _pinFocusNode) {
      focusNode.dispose();
    }

    for (final controller in _otpController) {
      controller.dispose();
    }
    for (final focusNode in _otpFocusNode) {
      focusNode.dispose();
    }

    referralCodeController.dispose();
    nameController.dispose();
    dateController.dispose();
    numberController.dispose();
    citizenshipController.dispose();
    jobController.dispose();
    _emailController.dispose();

    super.onClose();
  }

  Future<void> loginwithEmail(
    String email,
    Function onSuccess,
  ) async {
    isLoading = true;
    update();

    final result = await _authService.loginWithEmail(email);

    isLoading = false;
    message = result.data['message'];
    isRegistered = result.data['is_registered'];
    update();

    if (isRegistered) {
      Get.to(InputPinScreen());
    } else if (!isRegistered) {
      onSuccess();
      update();
    }
  }

  Future<void> handlePinAction() async {
    final pinCode = fullPin;
    final email = _emailController.text;

    isLoading = true;
    update();

    try {
      final result = isRegistered
          ? await _authService.pinLogin(
              token: token, email: email, pinCode: pinCode)
          : await _authService.creatPin(
              token: token, email: email, pinCode: pinCode);

      isLoading = false;

      if (result != null && result.data['status'] == 'success') {
        final newToken = result.data['token'];
        if (newToken != null) {
          await StorageService.saveToken(result.data['token']);
          getUserData();
          Get.offAll(() => NavBar());
        } else {
          Get.snackbar('Error', 'Token tidak ditemukan di respons');
        }
      } else {
        Get.snackbar('Login Gagal', 'Terjadi kesalahan saat login');
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar('Error', 'Terjadi kesalahan: ${e.toString()}');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpController.map((c) => c.text).join();
    final email = _emailController.text;

    final result = await _authService.verifyOtp(
      token: token,
      email: email,
      otp: otp,
    );

    if (result.data['status'] == 'success') {
      Get.offAll(() => RegistrationFormScreen());
    } else if (result.data['status'] == 'error') {
      Get.snackbar('Login Gagal', message);
    }
  }

  Future<bool> verifyOtpChanePin({VoidCallback? onSuccess}) async {
    final otp = otpController.map((c) => c.text).join();
    final email = _emailController.text.trim();

    isLoading = true;
    update();

    try {
      final response =
          await _authService.verifyOtpChangePin(email: email, otp: otp);

      if (response.statusCode == 200) {
        if (onSuccess != null) onSuccess();

        return true;
      } else {
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memverifikasi otp: $e');
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> registerUser() async {
    final result = await _authService.registerUser(
      token: token,
      name: nameController.text,
      gender: genderLabels[selectedGender].toString(),
      dateOfBirth: dateController.text,
      email: email,
      region: citizenshipController.text,
      job: jobController.text,
      phoneNumber: numberController.text,
      referralCode: referralCodeController.text,
    );

    if (result!.data['status'] == 'success') {
      Get.offAll(() => InputPinScreen());
    } else if (result.data['status'] == 'error') {
      Get.snackbar('Registrasi Gagal', message);
    }
  }

  Future<void> logout() async {
    isLoading = true;
    update();

    final success = await _authService.logout();

    isLoading = false;

    if (success) {
      _emailController.clear();
      isChecked = false;
      for (var c in _pinController) {
        c.clear();
      }
      for (var c in _otpController) {
        c.clear();
      }
      await StorageService.removeToken();
      Get.offAll(() => LoginScreen());
    } else if (!success) {
      Get.snackbar('Gagal logout.', message);
    }
    update();
  }

  Future<void> getUserData() async {
    isLoading = true;
    update();

    try {
      UserModel? fetchedUser = await _authService.fetchUserProfile();

      if (fetchedUser != null) {
        _user = fetchedUser;
      } else {
        Get.snackbar('Gagal mengambil data pengguna.',
            'Data tidak tersedia dari server ');
      }
    } catch (e) {
      Get.snackbar('Error',
          'Terjadi kesalahan saat mengambil data pengguna: ${e.toString()}');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> submitEditProfile() async {
    isLoading = true;
    update();

    try {
      final response = await _authService.editProfile(
        name:
            nameController.text.isNotEmpty ? nameController.text : user!.name!,
        gender: genderLabels[selectedGender],
        dateOfBirth: dateController.text.isNotEmpty
            ? dateController.text
            : DateFormat("yyyy-MM-dd", "id_ID").format(user!.dateOfBirth!),
        region: citizenshipController.text.isNotEmpty
            ? citizenshipController.text
            : user!.region!,
        job: jobController.text.isNotEmpty ? jobController.text : user!.job!,
        phoneNumber: numberController.text.isNotEmpty
            ? numberController.text
            : user!.phoneNumber!,
      );

      if (response.statusCode == 200) {
        await getUserData();
        Get.offAll(() => NavBar(page: 3));
      } else {
        Get.snackbar('Error', 'Gagal mengupdate profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> deleteAccount() async {
    isLoading = true;
    update();

    try {
      final response = await _authService.deleteAccount();

      if (response.statusCode == 200) {
        _emailController.clear();
        isChecked = false;
        for (var c in _pinController) {
          c.clear();
        }
        for (var c in _otpController) {
          c.clear();
        }
        await StorageService.removeToken();
        Get.offAll(() => LoginScreen());
      } else {
        Get.snackbar('Gagal', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalaham: $e');
    } finally {
      isLoading = true;
      update();
    }
  }

  Future<void> sendOtp() async {
    isLoading = true;
    update();

    try {
      await _authService.sendOtpChangePin(email: _emailController.text.trim());
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengirim otp: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> changePin() async {
    final pinCode = fullPin;
    final email = _emailController.text;

    try {
      final response =
          await _authService.changePin(email: email, newPinCode: pinCode);

      if (response.statusCode == 200) {
        Get.back();
      } else {
        Get.snackbar('Gagal', response.data['message'] ?? 'Gagal mengubah pin');
      }
    } catch (e) {
      Get.snackbar('Gagal', 'Terjadi kesalahan: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}
