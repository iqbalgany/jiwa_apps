import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/screens/authentication/login_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  Get.put(AuthController(), permanent: true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendDecaTextTheme(),
        appBarTheme: AppBarTheme(
          shadowColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 0,
          color: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
