import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/utils/colors.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  final AuthController authController = Get.find<AuthController>();

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
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(
                              color: authController.selectedJob == job
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: authController.selectedJob == job
                                  ? AppColors.primary
                                  : Colors.transparent,
                              border: Border.all(
                                color: authController.selectedJob == job
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
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
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(
                              color:
                                  authController.selectedNationality == country
                                      ? AppColors.primary
                                      : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  authController.selectedNationality == country
                                      ? AppColors.primary
                                      : Colors.transparent,
                              border: Border.all(
                                color: authController.selectedNationality ==
                                        country
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
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
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              SizedBox(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime(2100),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
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
          );
        },
      );
    } else if (Platform.isAndroid) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
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
                      authController.dateController.text =
                          DateFormat("yyyy-MM-dd", "id_ID").format(newDate);
                      authController.update();
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AuthController(),
        builder: (_) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kami ingin kenal kamu lebih dekat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masukkan nama dan tanggal lahir kamu ya!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 25),

                  /// KODE REFERRAL
                  TextField(
                    controller: authController.referralCodeController,
                    decoration: InputDecoration(
                      hintText: 'Kode Referral (Opsional)',
                      hintStyle: TextStyle(
                        color: AppColors.greyText,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  /// NAME
                  TextField(
                    controller: authController.nameController,
                    decoration: InputDecoration(
                      hintText: 'Nama Kamu *',
                      hintStyle: TextStyle(
                        color: AppColors.greyText,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

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
                  SizedBox(height: 25),

                  /// DATE OF BIRTH
                  TextField(
                    controller: authController.dateController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                      hintText: 'Tanggal Lahir *',
                      hintStyle: TextStyle(color: AppColors.greyText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                    ),
                    onTap: () => _selectDate(context),
                    readOnly: true,
                  ),
                  SizedBox(height: 25),

                  /// NUMBER
                  TextField(
                    controller: authController.numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Nomor Telepon',
                      hintStyle: TextStyle(
                        color: AppColors.greyText,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  /// CITIZENSHIP
                  TextField(
                    controller: authController.citizenshipController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                      hintText: 'Kewarganegaraan',
                      hintStyle: TextStyle(color: AppColors.greyText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                    ),
                    onTap: () => _showCitizenshipBottomSheet(context),
                    readOnly: true,
                  ),
                  SizedBox(height: 25),

                  /// JOB
                  TextField(
                    controller: authController.jobController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                      hintText: 'Pekerjaan',
                      hintStyle: TextStyle(color: AppColors.greyText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyText)),
                    ),
                    onTap: () => _showJobBottomSheet(context),
                    readOnly: true,
                  ),
                  SizedBox(height: 30),

                  /// BUTTON
                  GestureDetector(
                    onTap: () {
                      authController.registerUser();
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
                          'Lanjut',
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
          ),
        ),
      ),
    );
  }
}
