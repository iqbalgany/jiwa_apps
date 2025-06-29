import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';

import '../../utils/colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

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
                                  authController.changePin();
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
                              authController.verifyOtpChanePin(onSuccess: () {
                                Get.back();
                                _inputNewPin(context);
                              });
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

  void _showJobBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (context) {
        return GetBuilder(
          init: AuthController(),
          builder: (_) => Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            height: MediaQuery.sizeOf(context).height * 0.9,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      'Pilih Pekerjaan',
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
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: authController.jobs.asMap().entries.map(
                    (entry) {
                      String job = entry.value;
                      return ListTile(
                        onTap: () {
                          authController.selectedJob = job;
                          authController.update();
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          job,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: authController.selectedJob == job
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: authController.selectedJob == job
                                  ? AppColors.primary
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    authController.jobController.text =
                        authController.selectedJob;
                    authController.update();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.whiteText,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCitizenshipBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (
        context,
      ) {
        return GetBuilder(
          init: AuthController(),
          builder: (_) => Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            height: MediaQuery.sizeOf(context).height * 0.9,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      'Pilih Kewarganegaraan',
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
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: authController.countries.asMap().entries.map(
                    (entry) {
                      String country = entry.value;
                      return ListTile(
                        onTap: () {
                          authController.selectedNationality = country;
                          authController.update();
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          country,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: authController.selectedNationality == country
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color:
                                  authController.selectedNationality == country
                                      ? AppColors.primary
                                      : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    authController.citizenshipController.text =
                        authController.selectedNationality;
                    authController.update();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.whiteText,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectDate(BuildContext context) {
    DateTime selectDate = DateTime.now();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  onDateChanged: (DateTime newDate) {
                    selectDate = newDate;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  authController.dateController.text =
                      DateFormat("yyyy-MM-dd", "id_ID").format(selectDate);
                  authController.update();
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.whiteText,
                        decoration: TextDecoration.none,
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

  void showDeleteAccountBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 130,
                height: 130,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.no_accounts_outlined,
                  color: AppColors.secondary,
                  size: 110,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Kamu yakin mau hapus akun ini?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                'Profil, XP, dan riwayat transaksi akan ikut dihapus secara permanen bersama dengan akun kamu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  deleteButton(
                    context,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Batal',
                    bgColor: AppColors.white,
                    borderColor: AppColors.black,
                    textColor: AppColors.black,
                  ),
                  SizedBox(width: 20),
                  deleteButton(
                    context,
                    onTap: () {
                      Get.back();
                      authController.deleteAccount();
                    },
                    text: 'Hapus',
                    bgColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    textColor: AppColors.white,
                  ),
                ],
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Ubah Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          if (controller == null) {
            return CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// KODE REFERRAL
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: authController.referralCodeController,
                          decoration: InputDecoration(
                            hintText: 'Kode Referral (Opsional)',
                            hintStyle: TextStyle(
                              color: AppColors.greyText,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// NAME
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Kamu *',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: authController.nameController,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: authController.user!.name,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// GENDER
                  Text(
                    'Jenis Kelamin *',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          authController.selectedGender = 0;
                          authController.update();
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: authController.selectedGender == 0
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: authController.selectedGender == 0
                                  ? AppColors.primary
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Laki-laki',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          authController.selectedGender = 1;
                          authController.update();
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: authController.selectedGender == 1
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: authController.selectedGender == 1
                                  ? AppColors.primary
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Perempuan',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  /// DATE OF BIRTH
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal Lahir *',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: authController.dateController,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: DateFormat("yyyy-MM-dd", "id_ID")
                                .format(authController.user!.dateOfBirth!),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onTap: () => _selectDate(context),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// EMAIL
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address *',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          controller: authController.emailController,
                          decoration: InputDecoration(
                            enabled: false,
                            labelText: authController.user!.email,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// NUMBER
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor Ponsel *',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          controller: authController.numberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: authController.user!.phoneNumber,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// CITIZENSHIP
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kewarganegaraan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: authController.citizenshipController,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: authController.user!.region,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onTap: () => _showCitizenshipBottomSheet(context),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// JOB
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pekerjaan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: authController.jobController,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: authController.user!.job,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Colors.transparent),
                            suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onTap: () => _showJobBottomSheet(context),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// PIN
                  GestureDetector(
                    onTap: () {
                      authController.sendOtp().then(
                        (_) {
                          _verificationBottomSheet(Get.context!);
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyText),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Ubah',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      showDeleteAccountBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        Text(
                          'Hapus akun JIWA+',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  /// BUTTON
                  GestureDetector(
                    onTap: () {
                      authController.submitEditProfile();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.whiteText,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget deleteButton(BuildContext context,
      {String? text,
      Color? bgColor,
      Color? borderColor,
      Color? textColor,
      Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: borderColor!)),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
