import 'package:flutter/material.dart';
import 'package:jiwa_apps/screens/home/home_screen.dart';
import 'package:jiwa_apps/screens/menu/menu_screen.dart';
import 'package:jiwa_apps/screens/order/order_screen.dart';
import 'package:jiwa_apps/screens/profile/profile_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildContext(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();

      case 1:
        return const MenuScreen();

      case 2:
        return const OrderScreen();

      case 3:
        return const ProfileScreen();

      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildContext(currentIndex),
          customNavBar(context),
        ],
      ),
    );
  }

  Widget customNavBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navbarItem(
              index: 0,
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            navbarItem(
              index: 1,
              icon: Icons.fastfood_outlined,
              text: 'Menu',
            ),
            navbarItem(
              index: 2,
              icon: Icons.sticky_note_2_outlined,
              text: 'Order',
            ),
            navbarItem(
              index: 3,
              icon: Icons.person_outline,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget navbarItem({
    String? text,
    int? index,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: () {
        onTabTapped(index!);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                currentIndex == index ? AppColors.primary : Colors.grey[300]!,
            size: 30,
          ),
          Text(
            text!,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color:
                  currentIndex == index ? AppColors.primary : Colors.grey[300]!,
            ),
          ),
        ],
      ),
    );
  }
}
