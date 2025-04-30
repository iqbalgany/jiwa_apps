import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiwa_apps/utils/colors.dart';
import 'package:jiwa_apps/widgets/nav_bar.dart';

class InputPinScreen extends StatefulWidget {
  const InputPinScreen({super.key});

  @override
  State<InputPinScreen> createState() => _InputPinScreenState();
}

class _InputPinScreenState extends State<InputPinScreen> {
  final List<TextEditingController> _controller =
      List.generate(6, (_) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masukkan PIN',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Masukkan 6 angka PIN kamu',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: List.generate(
              6,
              (index) => Expanded(
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller[index].text.isNotEmpty
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      color: _controller[index].text.isNotEmpty
                          ? AppColors.primary
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    controller: _controller[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofocus: true,
                    cursorColor: Colors.transparent,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 1,
                    ),
                    onChanged: (value) {
                      bool isCompleted =
                          _controller.every((c) => c.text.isNotEmpty);
                      setState(() {});
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                      if (isCompleted) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => NavBar()));
                      }
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
