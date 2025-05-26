import 'package:flutter/material.dart';
import 'package:jiwa_apps/screens/profile/address_form_screen.dart';
import 'package:jiwa_apps/screens/profile/search_location_screen.dart';

import '../../utils/colors.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyBG,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text(
            'Kopi Susu Karamel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchLocationScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Tambah Alamat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.black,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Simpan alamat favorit yang kamu mau di sini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      20,
                      index == 0 ? 20 : 10,
                      20,
                      index == 10 - 1 ? 50 : 10,
                    ),
                    child: cardAddressItem(context),
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget cardAddressItem(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bookmark,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rumah',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Muhammad Iqbal Al Afgany - 62810987654321',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Taman Jemursari Selatan I No.5a, Jemur Wonosari, Kec. Wonocolo, Surabaya, Jawa Timur 60237',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.greyBG,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black26,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.sticky_note_2_rounded,
                                color: Colors.black26,
                                size: 12,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'test',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddressFormScreen())),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: AppColors.greyBG,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: AppColors.secondary,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
