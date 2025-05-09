import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiwa_apps/utils/colors.dart';
import 'package:jiwa_apps/widgets/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: NavBar(),
    );
  }
}
