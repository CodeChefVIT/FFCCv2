import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/core/failures/failures.dart';
import 'package:ffccv2_app/features/FFCC/data/repository/auth_repo.dart';
import 'package:ffccv2_app/features/FFCC/domain/models/auth_model.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/login_page.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/headers.dart';
import 'package:ffccv2_app/features/FFCC/presentation/widgets/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signupPage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController? emailCont, passCont;
  late AuthRepository authRepository;
  @override
  void initState() {
    authRepository = AuthRepository();
    emailCont = TextEditingController();
    passCont = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCont!.dispose();
    passCont!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (authRepository.isLoading.value) {
            return Container(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                ));
          } else {
            return Column(
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
                      isEmail: true,
                      label: 'Email',
                      hint: 'example@gmail.com',
                      controller: emailCont,
                    ),
                    CustomTextField(
                      label: 'Password',
                      hint: 'abc@123',
                      isPassword: true,
                      controller: passCont,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(
                          color: KColor.secondayColor,
                          onPressed: () async {
                            //Get.toNamed(FacultyReviewSearchPage.routeName);
                            var res = await authRepository.signUp(Auth(
                                email: emailCont!.text,
                                password: passCont!.text));
                            res.fold((l) {
                              if (l is ServerFailure)
                                print('server');
                              else if (l is UserExist)
                                print('exists');
                              else
                                print('error');
                            }, (r) => print('success'));
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
                                ..onTap =
                                    () => Get.toNamed(LoginPage.routeName)),
                        ]))
                  ],
                ))
              ],
            );
          }
        }),
      ),
    );
  }
}
