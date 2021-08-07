import 'package:ffccv2_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';

class FacultyReviewPage extends StatefulWidget {
  static const String routeName = '/facultyReviewPage';
  const FacultyReviewPage({Key? key}) : super(key: key);

  @override
  _FacultyReviewPageState createState() => _FacultyReviewPageState();
}

class _FacultyReviewPageState extends State<FacultyReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.back(),
        ),
        title: Text('Faculty Name here'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 55,
                backgroundColor: KColor.accentColor,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ABC XYZ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'School: ABC XYZ School',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Rate the faculty',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 45,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.amber.shade100,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Points about the faculty',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLines: 11,
                        decoration: InputDecoration(
                          hintText: 'Comments',
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
