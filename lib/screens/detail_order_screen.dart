import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:jiwa_apps/utils/colors.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBG,
      appBar: AppBar(
        title: Text(
          'Detail Status Pesanan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Terima kasih #temansejiwa!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Selamat menikmati dan terus gunakan JIWA+ ya!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.secondary,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Order ID: J+20251261740549300001',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.file_copy_outlined,
                            color: AppColors.black,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal : 26 Feb 2025 | 12:55',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Syarat Dan Ketentuan',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Kurir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff07a60b),
                                ),
                                child: Icon(
                                  Icons.archive,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GoSend',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'GK-11-804875780',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.file_copy_outlined,
                                          color: AppColors.black,
                                          size: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Icon(
                                  Icons.account_circle,
                                  color: AppColors.black,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'santri Hengki Purnomo',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Delivery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
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
                                Icons.store_mall_directory_outlined,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 80,
                              dashLength: 5,
                              dashColor: Colors.black38,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lokasi Outlet',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'BARATA',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Jl. Barata Jaya 19 No 52B Surabaya',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 65),
                              Text(
                                'Alamat Pengiriman',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Mahadevi Katarina - 6287654321',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black26,
                                ),
                              ),
                              Text(
                                'Taman Jemursari Selatan I, Jemur Wonosari, Surabaya, Jawa Timur, Indonesia',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Pesanan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/kopi1.png',
                          scale: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1x Buy 1 Get 1 Free Minuman',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Item 1: ',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1 Kopi Susu Sahabat Large',
                                    style: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Item 1: ',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '1 Kopi Susu Sahabat Large',
                                    style: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rp20.500',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp37.000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: AppColors.primary,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp25.000',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Takeaway Charge',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp3.500',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp13.000',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'JIWA POINT',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/cryptocurrency_logo.png',
                            scale: 15),
                        Text(
                          '-9.728',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 0.5),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp13.000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Point',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07a60b),
                          ),
                        ),
                        Text(
                          '694',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07a60b),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total XP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07a60b),
                          ),
                        ),
                        Text(
                          '16 XP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07a60b),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset('assets/ovo.png', scale: 15),
                        Text(
                          'OVO | +6282231166895',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Rp31.772',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: 0.5),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset('assets/cryptocurrency_logo.png',
                            scale: 15),
                        Text(
                          'Jiwa Point',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '9.728',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
