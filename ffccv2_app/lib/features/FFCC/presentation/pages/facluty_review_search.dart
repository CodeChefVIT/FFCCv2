import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/faculty_review_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FacultyReviewSearchPage extends StatefulWidget {
  static const String routeName = '/facultyReviewSearchPage';
  const FacultyReviewSearchPage({Key? key}) : super(key: key);

  @override
  _FacultyReviewSearchPageState createState() =>
      _FacultyReviewSearchPageState();
}

class _FacultyReviewSearchPageState extends State<FacultyReviewSearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.back(),
        ),
        title: Text('Faculty Review'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SearchBar(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Teachers',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * .72,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FacultySearchCard(
                      course: 'ABC XYZ',
                      name: 'ABC XYZ',
                      onTap: () => Get.toNamed(FacultyReviewPage.routeName),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class FacultySearchCard extends StatelessWidget {
  const FacultySearchCard({
    Key? key,
    required this.name,
    required this.course,
    this.onTap,
  }) : super(key: key);
  final String name, course;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: GestureDetector(
          onTap: onTap as void Function()?,
          child: Container(
            height: 70,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: KColor.accentColor,
              ),
              title: RichText(
                  text: TextSpan(
                      text: 'Name: ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(
                      text: name,
                      style: TextStyle(color: Colors.black),
                    ),
                  ])),
              subtitle: RichText(
                  text: TextSpan(
                      text: 'Course: ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(
                      text: course,
                      style: TextStyle(color: Colors.black),
                    ),
                  ])),
            ),
          ),
        ),
      ),
    );
  }
}
