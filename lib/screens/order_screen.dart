import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/screens/detail_order_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int currentIndex = 0;
  bool takeAwayChecked = false;
  bool dineInChecked = false;
  bool deliveryChecked = false;
  bool selesaiChecked = false;
  bool dibatalkanChecked = false;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _selectStartDate(BuildContext context) {
    DateTime startDate = DateTime.now();
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
                    startDate = newDate;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _startDateController.text =
                        DateFormat('dd/MM/yyyy').format(startDate);
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

  void _selectEndDate(BuildContext context) {
    DateTime endDate = DateTime.now();
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
                    endDate = newDate;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _endDateController.text =
                        DateFormat('dd/MM/yyyy').format(endDate);
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

  void shippingMethod() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Metode Pengiriman',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  shippingOption(setState, takeAwayChecked, 'Take Away',
                      (value) {
                    setState(() {
                      takeAwayChecked = value!;
                    });
                  }),
                  shippingOption(setState, dineInChecked, 'Dine In', (value) {
                    setState(() {
                      dineInChecked = value!;
                    });
                  }),
                  shippingOption(setState, deliveryChecked, 'Delivery',
                      (value) {
                    setState(() {
                      deliveryChecked = value!;
                    });
                  }),
                  Divider(thickness: 0.5),
                  SizedBox(height: 10),
                  Text(
                    'Status Pesanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  shippingOption(setState, selesaiChecked, 'Selesai', (value) {
                    setState(() {
                      selesaiChecked = value!;
                    });
                  }),
                  shippingOption(setState, dibatalkanChecked, 'Dibatalkan',
                      (value) {
                    setState(() {
                      dibatalkanChecked = value!;
                    });
                  }),
                  Divider(thickness: 0.5),
                  SizedBox(height: 10),
                  Text(
                    'Periode Pesanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _startDateController,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      onTap: () => _selectStartDate(context),
                                      readOnly: true,
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.black12,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _endDateController,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      onTap: () => _selectEndDate(context),
                                      readOnly: true,
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Row(
                    children: [
                      filterButton(
                        context,
                        onTap: () {
                          setState(
                            () {
                              takeAwayChecked = false;
                              dineInChecked = false;
                              deliveryChecked = false;
                              selesaiChecked = false;
                              dibatalkanChecked = false;
                              _endDateController.clear();
                              _startDateController.clear();
                            },
                          );
                        },
                        text: 'Reset Filter',
                        bgColor: AppColors.white,
                        borderColor: AppColors.black,
                        textColor: AppColors.black,
                      ),
                      SizedBox(width: 20),
                      filterButton(
                        context,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Simpan',
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
      },
    );
  }

  Widget filterButton(BuildContext context,
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

  Widget shippingOption(
    StateSetter setState,
    bool isChecked,
    String? text,
    Function(bool?) onChanged,
  ) {
    return Row(
      children: [
        Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: isChecked ? AppColors.primary : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
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
                  SizedBox(height: 20),
                  Row(
                    children: [
                      statusOrderSection(context, 'Ongoing', 0),
                      statusOrderSection(context, 'History', 1),
                    ],
                  ),
                  if (currentIndex == 0) ...[
                    SizedBox(height: 40),
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
                    ),
                  ] else ...[
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 100),
                        itemCount: 5,
                        itemBuilder: (context, index) => orderCard(context),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  shippingMethod();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(160, 0, 160, 90),
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.filter_alt_sharp,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusOrderSection(
    BuildContext context,
    String? text,
    int? index,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTabTapped(index!);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Text(
                text!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: currentIndex == index
                      ? AppColors.primary
                      : AppColors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 5,
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.primary
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Icons.directions_bike_sharp,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rp41.500',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.3,
                ),

                ///
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
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.file_copy_outlined,
                        color: AppColors.black,
                        size: 14,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '26 Feb 2025 | 12:55',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                ///
                Row(
                  children: [
                    Icon(
                      Icons.store_mall_directory_outlined,
                      color: AppColors.secondary,
                      size: 30,
                    ),
                    Text(
                      'BARATA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1 Item',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Buy 1 Get 1 Free Minuman',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(height: 15),

                ///
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Icons.flag,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Taman Jemursari Selatan I No.5a, Jemur Wonosari, Kec. Wonocolo, Surabaya, Jawa Timur 60237',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                ///
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        'Pesan Ulang',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailOrderScreen(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(left: 20, top: 15),
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Text(
              'Order Completed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.whiteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
