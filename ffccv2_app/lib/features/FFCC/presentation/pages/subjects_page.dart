import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SubjectPage extends StatefulWidget {
  static const String subjectsPage = 'subjectsPage';
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

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
                      kbooksPath,
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
                          'CHOOSE',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          'SUBJECTS',
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
                    'Enter number of subjects :',
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
                          controller: controller,
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
                        controller.value.text.isNotEmpty
                            ? showSubjectBottomSheet()
                            : null;
//Get.toNamed(TeachersPage.teachersPage);
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

  showSubjectBottomSheet() {
    Get.bottomSheet(
        CustomBottomSheet(
          controller: controller,
          title: 'SUBJECTS CODE',
        ),
        backgroundColor: Colors.white);
  }
}
