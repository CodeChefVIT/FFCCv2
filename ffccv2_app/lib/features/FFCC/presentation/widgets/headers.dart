import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpLoginHeader extends StatelessWidget {
  const SignUpLoginHeader({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
        Text(
          label,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        SizedBox(
          width: 30,
        )
      ],
    );
  }
}
