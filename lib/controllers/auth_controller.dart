import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final List<FocusNode> _otpFocusNode =
      List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _otpController =
      List.generate(4, (_) => TextEditingController());

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

    final result = isRegistered
        ? await _authService.pinLogin(
            token: token, email: email, pinCode: pinCode)
        : await _authService.creatPin(
            token: token, email: email, pinCode: pinCode);

    isLoading = false;

    if (result!.data['status'] == 'success') {
      await StorageService.saveToken(result.data['token']);
      Get.offAll(() => NavBar());
    } else if (result.data['status'] == 'error') {
      Get.snackbar('Login Gagal', message);
    }
    update();
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

  Future<void> registerUser() async {
    final name = nameController.text;
    final gender = genderLabels[selectedGender];
    final dateOfBirth = dateController.text;
    final region = citizenshipController.text;
    final job = jobController.text;
    final phoneNumber = numberController.text;
    final referralCode = referralCodeController.text;

    final result = await _authService.registerUser(
      token: token,
      name: name,
      gender: gender.toString(),
      dateOfBirth: dateOfBirth,
      email: email,
      region: region,
      job: job,
      phoneNumber: phoneNumber,
      referralCode: referralCode,
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
      _pinController.forEach((controller) => controller.clear());
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

    UserModel? fetchedUser = await _authService.fetchUserProfile();

    isLoading = false;
    update();

    if (fetchedUser != null) {
      _user = fetchedUser;
      update();
    } else {
      Get.snackbar('Gagal mengambil data pengguna.', message);
    }
  }
}
