import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/signup_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/timeTable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeTablePage extends StatefulWidget {
  static const String routeName = '/timetablePage';
  TimeTablePage({Key? key}) : super(key: key);

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(SignUpPage.routeName);
              },
              icon: Icon(Icons.download))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * .77,
            color: Colors.grey.shade100,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    TheoryHeader(),
                    LabHeader(),
                    WeekDayTT(
                      day: 'Monday',
                    ),
                    WeekDayTT(
                      day: 'Tuesday',
                    ),
                    WeekDayTT(
                      day: 'Wednes\nday',
                    ),
                    WeekDayTT(
                      day: 'Thrusday',
                    ),
                    WeekDayTT(
                      day: 'Friday',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: size.height * .06,
              child: MaterialButton(
                color: KColor.primaryColor,
                onPressed: () => //First check login then review
                    Get.toNamed(SignUpPage.routeName),
                child: Text(
                  'Review Faculty',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
