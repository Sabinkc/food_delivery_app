import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/common_button.dart';
import 'package:food_delivery_app/common/common_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import '../common/common_password_textfield.dart';
import '../common/constants.dart';
import 'bottom_navigation_pages/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final initailPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    initailPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                Icon(
                  Icons.food_bank,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create account",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  prefixIcon: Icons.email,
                  hintText: "Enter your email",
                  textFieldColor: Colors.white,
                  isObscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter required fields";
                    } else if (!EmailValidator.validate(value)) {
                      return "Please enter correct email address";
                    } else {
                      return null;
                    }
                  },
                ),
                // confirm password not working
                CommonPasswordTextField(
                    controller: initailPasswordController,
                    prefixIcon: Icons.lock,
                    hintText: "Enter your password",
                    textFieldColor: Colors.white,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter required fields";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      } else {
                        return null;
                      }
                    }),
                // confirm password field is Not working
                CommonPasswordTextField(
                    controller: confirmPasswordController,
                    prefixIcon: Icons.lock,
                    hintText: "Confirm Password",
                    textFieldColor: Colors.white,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter required fields";
                      } else if (confirmPasswordController.text !=
                          initailPasswordController.text) {
                        return "Re-enter your password";
                      } else {
                        return null;
                      }
                    }),
                CommonTextField(
                    prefixIcon: Icons.people,
                    hintText: "Username",
                    textFieldColor: Colors.white,
                    isObscure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username";
                      } else {
                        return null;
                      }
                    }),
                CommonTextField(
                    prefixIcon: Icons.place,
                    hintText: "Address",
                    textFieldColor: Colors.white,
                    isObscure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your address";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                CommonButton(
                  buttonText: "Register",
                  buttonColor: Colors.red,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => HomeScreen())));
                    }
                  },
                ),

                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LogInScreen())));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
