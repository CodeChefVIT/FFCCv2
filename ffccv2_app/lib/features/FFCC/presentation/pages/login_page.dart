import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/headers.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            label: 'Login',
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
                      // Get.toNamed(SignUpPage.routeName);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
