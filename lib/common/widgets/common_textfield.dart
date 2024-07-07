import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';

class CommonTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final Color textFieldColor;
  bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  CommonTextField(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.textFieldColor,
      required this.isObscure,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: textFieldColor, borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isObscure,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              fillColor: Constants.primaryColor,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              // focusedErrorBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              prefixIcon: Icon(
                prefixIcon,
              ),
              prefixIconColor: Colors.grey,
              errorStyle: TextStyle(
                color: Colors.red,
              )),
        ));
  }
}
