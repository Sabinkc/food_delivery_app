import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';

class CommonPasswordTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final Color textFieldColor;
  bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  CommonPasswordTextField(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.textFieldColor,
      required this.isObscure,
      required this.validator,
      required this.controller});

  @override
  State<CommonPasswordTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.textFieldColor,
            borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isObscure,
          decoration: InputDecoration(
              hintText: widget.hintText,
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
                widget.prefixIcon,
              ),
              suffixIcon: widget.isObscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isObscure = !widget.isObscure;
                        });
                      },
                      icon: Icon(Icons.visibility))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isObscure = !widget.isObscure;
                        });
                      },
                      icon: Icon(Icons.visibility_off)),
              prefixIconColor: Colors.grey,
              errorStyle: TextStyle(
                color: Colors.red,
              )),
        ));
  }
}
