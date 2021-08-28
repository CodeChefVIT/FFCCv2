import 'dart:io';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/features/FFCC/domain/models/subjects_response_model.dart';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:ffccv2_app/core/failures/failures.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubjectsRepository extends GetxController {
  RxBool isLoading = false.obs;

  Future<Either<Failure, SubjectsRes>> fectchSubjects() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(getCoursesPath),
          headers: {HttpHeaders.contentTypeHeader: "application/json"});

      if (response.statusCode == 200) {
        var data = response.body as Map<String, dynamic>;

        isLoading.value = false;
        return right(SubjectsRes.fromJson(data));
      } else if (response.statusCode == 400) {
        isLoading.value = false;
        return left(RequestTimeoutFailure());
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
