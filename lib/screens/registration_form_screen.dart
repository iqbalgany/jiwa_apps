import 'package:flutter/material.dart';
import 'package:jiwa_apps/utils/colors.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  TextEditingController _referralCodeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _citizenshipController = TextEditingController();
  String _selectedNationality = '';

  final List<String> _countries = [
    'Indonesia',
    'Singapore',
    'Malaysia',
    'Vietnam',
    'Thailand',
    'Other',
  ];

  void _showCitizenshipBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
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
                children: _countries.map(
                  (country) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        country,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Radio<String>(
                        value: country,
                        groupValue: _selectedNationality,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedNationality = value!;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
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
                      color: AppColors.white,
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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectDate != null) {
      setState(() {
        _dateController.text = "${selectDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2,
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
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2,
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                TextField(
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
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Pekerjaan',
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
