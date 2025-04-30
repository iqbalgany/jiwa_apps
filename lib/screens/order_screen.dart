import 'package:flutter/material.dart';
import 'package:jiwa_apps/utils/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Order',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          'Ongoing',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 5,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.secondary,
                size: 100,
              ),
            ),
            Text(
              'Belum ada pesanan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Kamu bisa cek pesanan yang sedang diproses di sini',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary,
              ),
              child: Text(
                'Pesan Sekarang',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
