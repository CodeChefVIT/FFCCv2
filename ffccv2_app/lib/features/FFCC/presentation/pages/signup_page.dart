import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/facluty_review_search.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/login_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/headers.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signupPage';
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SignUpLoginHeader(
            label: 'Sign Up',
          ),
          SizedBox(
            height: size.height * .15,
          ),
          Form(
              child: Column(
            children: [
              CustomTextField(
                label: 'Email',
                hint: 'example@gmail.com',
              ),
              CustomTextField(
                label: 'Password',
                hint: 'abc@123',
                isPassword: true,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: KColor.secondayColor,
                    onPressed: () {
                      Get.toNamed(FacultyReviewSearchPage.routeName);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have account? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(LoginPage.routeName)),
                  ]))
            ],
          ))
        ],
      ),
    );
  }
}
