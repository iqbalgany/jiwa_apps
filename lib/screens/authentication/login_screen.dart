import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  void _verificationBottomSheet(BuildContext context) {
    authController.otpController.forEach((controller) => controller.clear());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.9,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Verifikasi Email Kamu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      authController.emailController.clear();
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                ],
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Masukkan OTP yang dikirimkan ke Email ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: authController.emailController.text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: List.generate(
                  4,
                  (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: KeyboardListener(
                        focusNode: FocusNode(),
                        onKeyEvent: (event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey ==
                                  LogicalKeyboardKey.backspace &&
                              authController
                                  .otpController[index].text.isEmpty &&
                              index > 0) {
                            authController.otpFocusNode[index - 1]
                                .requestFocus();
                          }
                        },
                        child: TextField(
                          maxLength: 1,
                          controller: authController.otpController[index],
                          focusNode: authController.otpFocusNode[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusColor: AppColors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.greenText,
                              ),
                            ),
                            counterText: '',
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              authController.otpFocusNode[index + 1]
                                  .requestFocus();
                            }
                            final isCompleted = authController.otpController
                                .every((c) => c.text.isNotEmpty);
                            if (isCompleted) {
                              authController.verifyOtp();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) => SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dapet poin dari transaksi\n& layanan prioritas',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.whiteText,
                          ),
                        ),
                        Text(
                          'Bisa dapet Plus Poin untuk ditukar\ndengan potongan harga untuk\ntransaksi kamu.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: AppColors.whiteText,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/people_coffe.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 700,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Silahkan masuk dengan email yang terdaftar. Pastikan emaul kamu aktif.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: authController.emailController,
                          onChanged: (value) => authController.email = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Masukkan Email Anda',
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontSize: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.blueContainer,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              value: authController.isChecked,
                              onChanged: (value) {
                                authController.isChecked = value!;
                                authController.update();
                              },
                              activeColor: authController.isChecked
                                  ? AppColors.primary
                                  : null,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Dengan masuk kamu menyetujui ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Syarat & Ketentuan dan\nkebijakan Privasi ',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Jiwa+',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            if (authController.isChecked) {
                              authController.loginwithEmail(
                                  authController.emailController.text.trim(),
                                  () => _verificationBottomSheet(context));
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: authController.isChecked
                                  ? AppColors.primary
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: authController.isChecked
                                      ? AppColors.white
                                      : Colors.black26,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
