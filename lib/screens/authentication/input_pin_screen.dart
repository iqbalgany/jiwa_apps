import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/utils/colors.dart';

class InputPinScreen extends StatelessWidget {
  InputPinScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

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
            )
          ],
        ),
      ),
    );
  }
}
