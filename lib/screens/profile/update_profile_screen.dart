import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _referralCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
      backgroundColor: AppColors.white,
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
      backgroundColor: AppColors.white,
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
                  setState(() {
                    _dateController.text =
                        DateFormat('dd/MM/yyyy').format(selectDate);
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
          ),
        );
      },
    );
  }

  void showDeleteAccountBottomSheet() {
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
                      setState(
                        () {
                          Navigator.pop(context);
                        },
                      );
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
                      Navigator.pop(context);
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
      body: SingleChildScrollView(
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
                      controller: _referralCodeController,
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
                      controller: _nameController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
                      controller: _dateController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
                      controller: _emailController,
                      decoration: InputDecoration(
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
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                      controller: _citizenshipController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
                      controller: _jobController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
                onTap: () {},
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
                  showDeleteAccountBottomSheet();
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
                  Navigator.pop(context);
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
