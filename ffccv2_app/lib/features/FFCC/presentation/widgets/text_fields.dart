import 'package:ffccv2_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.hint,
    this.isPassword = false,
    this.controller,
    this.isEmail = false,
  }) : super(key: key);
  final String? label, hint;
  final bool isPassword, isEmail;
  final TextEditingController? controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KColor.secondayColor,
              width: 1.3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KColor.secondayColor,
              width: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
