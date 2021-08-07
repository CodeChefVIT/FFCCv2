import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/core/failures/failures.dart';
import 'package:ffccv2_app/features/FFCC/domain/models/auth_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthRepository extends GetxController {
  RxBool isLoading = false.obs;
  // Future<Map> login() {}

  Future<Either<Failure, Map<String, dynamic>>> signUp(Auth auth) async {
    var data = auth.toJson();
    try {
      isLoading.value = true;
      final response = await http.post(Uri.parse(signUpPath),
          body: jsonEncode(data),
          headers: {HttpHeaders.contentTypeHeader: "application/json"});

      var body;
      if (response.statusCode == 200) {
        body = response.body;

        isLoading.value = false;
        return right(body);
      } else if (response.statusCode == 400) {
        print('error 400');
        isLoading.value = false;
        return left(UserExist());
      } else {
        print(response.statusCode);
        isLoading.value = false;
        return left(ServerFailure());
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
      return left(UnidentifiedFailure());
    }
  }
}
