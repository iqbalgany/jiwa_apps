import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/screens/input_pin_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  final TextEditingController _referralCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  String _selectedNationality = '';
  String _selectedJob = '';
  int? _selectedGender;

  final Map<int, String> genderLables = {
    0: 'Laki-laki',
    1: 'Perempuan',
  };

  final List<String> _countries = [
    'Indonesia',
    'Singapore',
    'Malaysia',
    'Vietnam',
    'Thailand',
    'Other',
  ];
  final List<String> _jobs = [
    'Enterpreneur',
    'Pelajar / Mahasiswa',
    'karyawan Swasta',
    'Pegawai Negeri Sipil',
    'Ibu Rumah Tangga',
    'Lainnya',
  ];

  void _showJobBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
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
                  children: _jobs.asMap().entries.map(
                    (entry) {
                      String job = entry.value;
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _selectedJob = job;
                          });
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
                            color: _selectedJob == job
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: _selectedJob == job
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
                    setState(() {
                      _jobController.text = _selectedJob;
                    });
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
      builder: (
        context,
      ) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
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
                  children: _countries.asMap().entries.map(
                    (entry) {
                      String country = entry.value;
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _selectedNationality = country;
                          });
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
                            color: _selectedNationality == country
                                ? AppColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: _selectedNationality == country
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
                    setState(() {
                      _citizenshipController.text = _selectedNationality;
                    });
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
                  setState(() {
                    _dateController.text =
                        DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                            .format(selectDate);
                  });
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
                      setState(() {
                        _dateController.text =
                            DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                .format(newDate);
                      });
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
      body: SafeArea(
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
                  controller: _referralCodeController,
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
                  controller: _nameController,
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
                        setState(() {
                          _selectedGender = 0;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedGender == 0
                              ? AppColors.primary
                              : Colors.transparent,
                          border: Border.all(
                            color: _selectedGender == 0
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
                        setState(() {
                          _selectedGender = 1;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedGender == 1
                              ? AppColors.primary
                              : Colors.transparent,
                          border: Border.all(
                            color: _selectedGender == 1
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
                  controller: _dateController,
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
                  controller: _numberController,
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
                  controller: _citizenshipController,
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
                  controller: _jobController,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InputPinScreen()));
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
    );
  }
}
