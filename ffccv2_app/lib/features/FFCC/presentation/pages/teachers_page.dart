import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeachersPage extends StatefulWidget {
  static const String teachersPage = 'teachersPage';
  @override
  _TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .3,
                  color: KColor.primaryColor,
                ),
                Container(
                  height: size.height * .7,
                  color: KColor.lightSkyBlue,
                ),
              ],
            ),
            Positioned(
              top: size.height * .17,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      kTeacherPath,
                      height: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUBJECT',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          'TEACHERS',
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * .4,
              right: 1,
              left: 1,
              child: Column(
                children: [
                  Text(
                    'Enter number of teachers :',
                    style: TextStyle(
                        fontSize: 20,
                        color: KColor.secondayColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    child: MaterialButton(
                      color: KColor.primaryColor,
                      onPressed: () {
                        // Get.toNamed(TeachersPage.teachersPage);
                      },
                      child: Text(
                        'Enter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
