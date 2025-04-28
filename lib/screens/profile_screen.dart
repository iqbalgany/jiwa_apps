import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
