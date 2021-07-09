import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/get_started_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/splash_screen.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/subjects_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/teachers_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/time_table_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: GetStartedPage.getStartedPage, page: () => GetStartedPage()),
        GetPage(name: SubjectPage.subjectsPage, page: () => SubjectPage()),
        GetPage(name: TeachersPage.teachersPage, page: () => TeachersPage()),
        GetPage(name: TimeTablePage.timetablePage, page: () => TimeTablePage()),
      ],
      theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: KColor.primaryColor,
          accentColor: KColor.accentColor,
          scaffoldBackgroundColor: Colors.white,
          buttonColor: KColor.secondayColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 45),
              primary: KColor.secondayColor,
              onPrimary: Colors.white,
            ),
          )),
      home: SplashScreen(),
    );
  }
}
