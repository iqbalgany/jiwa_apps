import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiwa_apps/screens/profile/saved_address_screen.dart';
import 'package:jiwa_apps/screens/profile/update_profile_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

import '../../controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  void showTermsOfServiceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.sizeOf(context).width,
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
                SizedBox(height: 20),
                Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Privacy Notice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Last updated on 12 October 2022',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'The protection of your personal data is of utmost importance to us. We are committed to protecting your personal data in compliance with the data protection laws applicable to you.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'This privacy notice (the "Privacy Notice") sets out the manner in which JIWA+ By Kopi Janji Jiwa collects, uses, processes and discloses your personal data. It may be supplemented by additional privacy statements, terms or notices provided to you from time to time. The JIWA+ By Kopi Janji Jiwo company that operates the relevant Service, as defined below, is the primary controller of the personal data that is provided to or collected by or for, the said Service.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'This Privacy Notice applies to all the mobile applications, websites, products, features and other services globally (including our physical stores), owned or operated by JIWA+ By Kopi Janji Jiwa (each, a "Service" and collectively, the "Services"). By submitting any personal data to us and by using our Services, you consent to us collecting, using, processing and disclosing your personal data in accordance with the terms of this Privacy Notice.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'What is "Personal Data"?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '\"Personal Data" is any information which can be used to identify you or from which you are identifiable. This includes your name, your mobile number, email address, location, delivery address, your JIWA account profile photo, payment information and Service usage information insofar as you may be identified from such information.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = authController.user;
    if (user == null) {
      return const Center(child: Text('Tidak ada data pengguna'));
    }
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.greyBG,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Text(
                    'JIWA+',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 20),

                  /// PROFILE
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: AppColors.secondary,
                          size: 60,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              user.name ?? '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.secondary,
                              ),
                            ),
                            Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.greyText,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateProfileScreen()));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: AppColors.secondary,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  /// REFERRAL CODE
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                        decoration: BoxDecoration(
                            color: AppColors.purplepastel,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              user.referralCode ?? '-',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: AppColors.whiteText,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.file_copy_outlined,
                                color: AppColors.whiteText,
                                size: 17,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share_outlined,
                                color: AppColors.whiteText,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Undang teman dan dapatkan voucher 50%',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  /// ITEM
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        profileItem(
                          icon: Icons.percent_rounded,
                          text: 'Subscription',
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.event_note_outlined,
                          text: 'Riwayat Pesanan',
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.location_on_outlined,
                          text: 'Alamat Tersimpan',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SavedAddressScreen()));
                          },
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.discount_outlined,
                          text: 'Voucher',
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.handshake_outlined,
                          text: 'Loyality Membership',
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.share_outlined,
                          text: 'Referral',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  /// HELPER
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        profileItem(
                          icon: Icons.support_agent_rounded,
                          text: 'Jiwa Care',
                        ),
                        Divider(),
                        profileItem(
                          icon: Icons.security_rounded,
                          text: 'Kebijakan Privasi',
                          onTap: () => showTermsOfServiceBottomSheet(context),
                        ),
                        Divider(),
                        profileItem(
                            icon: Icons.output_rounded,
                            text: 'Keluar',
                            onTap: () {
                              authController.logout();
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  /// APPS VERSION
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Versi Aplikasi 3.8.4 (10047)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  /// DITJEN PKTN
                  Text(
                    'Informasi Kontak Layanan Pengaduan Konsumen Direktorat Jenderal Perlindugan Konsumen dan Tertib Niaga,\nKementrian Perdagangan republik Indonesia',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 6.5,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Whatsapp Ditjen PKTN : 0853-1111-1010',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget profileItem({
    Function()? onTap,
    IconData? icon,
    String? text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Icon(
            icon,
            color: AppColors.secondary,
            size: 20,
          ),
        ),
        title: Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.secondary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
