import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/utils/colors.dart';

class InputPinScreen extends StatelessWidget {
  InputPinScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  void _inputNewPin(BuildContext context) {
    authController.pinController.forEach((controller) => controller.clear());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return GetBuilder<AuthController>(
          builder: (_) {
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
                  Text(
                    'Buat PIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Masukkan 6 angka PIN untuk menjaga keamanan akun JIWA+',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: List.generate(
                      6,
                      (index) => Expanded(
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: authController
                                    .pinController[index].text.isNotEmpty
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: authController
                                      .pinController[index].text.isNotEmpty
                                  ? AppColors.primary
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: KeyboardListener(
                            focusNode: FocusNode(),
                            onKeyEvent: (event) {
                              if (event is KeyDownEvent &&
                                  event.logicalKey ==
                                      LogicalKeyboardKey.backspace &&
                                  authController
                                      .pinController[index].text.isEmpty &&
                                  index > 0) {
                                authController.pinFocusNode[index - 1]
                                    .requestFocus();
                              }
                            },
                            child: TextField(
                              maxLength: 1,
                              controller: authController.pinController[index],
                              focusNode: authController.pinFocusNode[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: Colors.transparent,
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(
                                color: Colors.transparent,
                                fontSize: 1,
                              ),
                              onChanged: (value) {
                                authController.update();

                                if (value.isNotEmpty && index < 5) {
                                  authController.pinFocusNode[index + 1]
                                      .requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  authController.pinFocusNode[index - 1]
                                      .requestFocus();
                                }

                                final isComplete = authController.pinController
                                    .every((c) => c.text.isNotEmpty);

                                if (isComplete) {
                                  FocusScope.of(context).unfocus();
                                  authController.changeForgotPin();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
                              authController.verifyOtpForgotPin(
                                onSuccess: () {
                                  Get.back();
                                  _inputNewPin(context);
                                },
                              );
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
      appBar: AppBar(
        title: Text(
          'Masukkan PIN',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        init: AuthController(),
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan 6 angka PIN kamu',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: List.generate(
                6,
                (index) => Expanded(
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: authController.pinController[index].text.isNotEmpty
                          ? AppColors.primary
                          : Colors.transparent,
                      border: Border.all(
                        color:
                            authController.pinController[index].text.isNotEmpty
                                ? AppColors.primary
                                : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: KeyboardListener(
                      focusNode: FocusNode(),
                      onKeyEvent: (event) {
                        if (event is KeyDownEvent &&
                            event.logicalKey == LogicalKeyboardKey.backspace &&
                            authController.pinController[index].text.isEmpty &&
                            index > 0) {
                          authController.pinFocusNode[index - 1].requestFocus();
                        }
                      },
                      child: TextField(
                        maxLength: 1,
                        controller: authController.pinController[index],
                        focusNode: authController.pinFocusNode[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.transparent,
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          color: Colors.transparent,
                          fontSize: 1,
                        ),
                        onChanged: (value) {
                          authController.update();

                          if (value.isNotEmpty && index < 5) {
                            authController.pinFocusNode[index + 1]
                                .requestFocus();
                          }

                          final isComplete = authController.pinController
                              .every((c) => c.text.isNotEmpty);

                          if (isComplete) {
                            FocusScope.of(context).unfocus();
                            authController.handlePinAction();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 180),
            GestureDetector(
              onTap: () {
                authController.sendForgotPin();
                _verificationBottomSheet(context);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Lupa dengan PIN kamu? ',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: ' Kirim OTP',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
