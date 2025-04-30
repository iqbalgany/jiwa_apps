import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
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
