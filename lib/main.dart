import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiwa_apps/controllers/auth_controller.dart';
import 'package:jiwa_apps/screens/authentication/login_screen.dart';
import 'package:jiwa_apps/services/storage_service.dart';
import 'package:jiwa_apps/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  final token = await StorageService.getToken();
  Get.put(AuthController());

  runApp(MainApp(token: token));
}

class MainApp extends StatelessWidget {
  final String? token;
  const MainApp({super.key, required this.token});

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
