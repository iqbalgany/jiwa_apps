import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiwa_apps/screens/registration_form_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final List<TextEditingController> _OTPController =
      List.generate(4, (_) => TextEditingController());

  void _verificationBottomSheet(BuildContext context) {
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
                    onPressed: () => Navigator.pop(context),
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
                      text: ' qazxswert@gmail.com',
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
                      child: TextField(
                        controller: _OTPController[index],
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        autofocus: true,
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
                          bool isCompleted =
                              _OTPController.every((c) => c.text.isNotEmpty);
                          setState(() {});
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                          if (isCompleted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationFormScreen(),
                              ),
                            );
                          }
                        },
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
      body: SafeArea(
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
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: isChecked ? AppColors.primary : null,
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
                          if (isChecked) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => InputPinScreen(),
                            //   ),
                            // );
                            _verificationBottomSheet(context);
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isChecked
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
                                color: isChecked
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
    );
  }
}
