import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/subjects_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/semicircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GetStartedPage extends StatefulWidget {
  static const String routeName = 'getStartedPage';
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: KColor.primaryColor,
      child: Stack(
        children: [
          Positioned(
              left: 50,
              right: 50,
              top: size.height * .05,
              child: Column(
                children: [
                  SvgPicture.asset(
                    kCodechefLogoPath,
                    height: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Presents',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    kChefSvgPath,
                    height: 200,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'FFCCv2',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: SemiCirclePainter(color: Colors.white),
              size: Size(300, 300),
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            top: size.height * .6,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Hello VITIAN!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Automatically generate the best possible time table based upon the chosen options seeing if a slot is filled or not. ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SubjectPage.routeName);
                    },
                    child: Text('GET STARTED'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
