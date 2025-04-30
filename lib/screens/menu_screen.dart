import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Menu Screen',
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
