import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void recheckOrderBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.8,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 30,
                  height: 3,
                  color: Colors.black12,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Periksa kembali pesanan kamu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Anda akan membayar dan melakukan pesanan pada outlet dengan metode pemesanan di bawah ini :',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.delivery_dining_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Delivery',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.store_mall_directory_outlined,
                    color: AppColors.secondary,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green[50],
                              ),
                              child: Text(
                                '0.55 km',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.green[300],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'KANNA HOMESTAY',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Taman Jemursari Selatan I No.5a, Jemur Wonosari, Kec. Wonocolo, Surabaya, Jawa Timur 60237',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              DottedLine(
                lineLength: MediaQuery.sizeOf(context).width,
                dashLength: 5,
                dashColor: Colors.black12,
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Syarat dan Ketentuan Delivery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Harap pastikan alamat dan nomor telepon yang dimasukkan sudah benar dan dapat dihubungi oleh driver.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Customer harus mengambil produk yang dikembalikan oleh driver ke outlet jika tidak ada respons dari pembeli saat proses pengantaran. Outlet tidak berkewajiban mengantarkan kembali produk yang dikembalikan oleh driver.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pesanan yang tidak diambil customer apabila driver mengembalikan produk akan dianggap terjual dan tidak dapat direfund atau digantikan.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Tunjukan kode pick up kepada staf/barista saat mengambil pesanan Anda di outlet.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 100,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: Row(
                  children: [
                    optionButton(
                      context,
                      text: 'Kembali',
                      bgColor: AppColors.white,
                      borderColor: AppColors.black,
                      textColor: AppColors.black,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 20),
                    optionButton(
                      context,
                      text: 'Bayar',
                      bgColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      textColor: AppColors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
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
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-Wallet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                paymentMethodOptions(
                  image: 'assets/gopay.png',
                  name: 'GoPay',
                  index: 0,
                ),
                SizedBox(height: 60),
                paymentMethodOptions(
                  image: 'assets/shopeepay.png',
                  name: 'ShopeePay',
                  index: 1,
                ),
                SizedBox(height: 60),
                paymentMethodOptions(
                  image: 'assets/jenius.png',
                  name: 'Jenius',
                  index: 2,
                ),
                SizedBox(height: 60),
                paymentMethodOptions(
                  image: 'assets/dana.png',
                  name: 'Dana',
                  index: 3,
                ),
                SizedBox(height: 60),
                paymentMethodOptions(
                  image: 'assets/ovo.png',
                  name: 'OVO',
                  index: 24,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.19,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Icon(
                            Icons.notifications_active_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pastikan Saldo Cukup!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Pastikan saldo kau cukup sebelum melakukan pembayaran',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        recheckOrderBottomSheet();
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Konfirmasi',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.whiteText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row paymentMethodOptions({
    String? image,
    String? name,
    int? index,
  }) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 20),
        Text(
          name!,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            onTabTapped(index!);
          },
          child: Container(
            height: 20,
            width: 20,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(
                color:
                    selectedIndex == index ? AppColors.primary : Colors.black12,
                width: 1,
              ),
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index
                    ? AppColors.primary
                    : AppColors.white,
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.primary
                      : AppColors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget optionButton(BuildContext context,
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
          padding: EdgeInsets.symmetric(horizontal: 10),
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
