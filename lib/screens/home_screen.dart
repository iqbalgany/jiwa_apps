import 'package:flutter/material.dart';
import 'package:jiwa_apps/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe63638),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/promo_banner1.jpg',
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        itemIcon(
                          icon: Icons.people_outline,
                          text: 'Teman Sejiwa',
                          subText: '6576372 Exp',
                        ),
                        itemIcon(
                          icon: Icons.generating_tokens_outlined,
                          text: 'Jiwa Point',
                          subText: '694 Points',
                        ),
                        itemIcon(
                          icon: Icons.percent_rounded,
                          text: 'Subscription',
                          subText: '0 Subscription',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        homeVoucher(
                          context,
                          icon: Icons.discount_outlined,
                          text: 'Voucher Kamu',
                          subText: '19 Voucher',
                        ),
                        SizedBox(width: 15),
                        homeVoucher(
                          context,
                          icon: Icons.share_outlined,
                          text: 'Referral',
                          subText: 'Undang Temenmu',
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Buat Pesanan Sekarang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.store_mall_directory_outlined,
                            color: AppColors.secondary,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                'BARATA',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Janji Jiwa',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Text(
                            'JIWA',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/burger_geber.png',
                            width: 40,
                            height: 50,
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Ubah',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.sizeOf(context).width,
                    //   decoration: BoxDecoration(
                    //     color: AppColors.purple,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeVoucher(
    BuildContext? context, {
    String? text,
    String? subText,
    IconData? icon,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.sizeOf(context!).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subText!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                icon!,
                color: AppColors.secondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemIcon({
    IconData? icon,
    String? text,
    String? subText,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Icon(
            icon,
            color: AppColors.secondary,
            size: 30,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Colors.black,
          ),
        ),
        Text(
          subText!,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 9,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
