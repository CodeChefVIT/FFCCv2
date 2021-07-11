import 'package:ffccv2_app/features/FFCC/presentation/widgets/timeTable_widgets.dart';
import 'package:flutter/material.dart';

class TimeTablePage extends StatefulWidget {
  static const String routeName = '/timetablePage';
  TimeTablePage({Key key}) : super(key: key);

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * .8,
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
