import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/common_button.dart';
import 'package:food_delivery_app/common/widgets/common_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:food_delivery_app/features/authentication/ui/screens/login_screen.dart';
import '../../../../common/widgets/common_password_textfield.dart';
import '../../../../common/constants.dart';
import '../../../dashboard/ui/screens/bottom_navigation_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future SignUp(String email, String password) async {
    if (email == "" || password == "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Enter the required field"),
        ),
      );
    } else {
      try {
        UserCredential? _userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()));
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Registered successfully"),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: Text(e.toString()),
                )));
      }
      ;
    }
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
                  controller: emailController,
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

                CommonPasswordTextField(
                    controller: passwordController,
                    prefixIcon: Icons.lock,
                    hintText: "Enter password",
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
                // CommonPasswordTextField(
                //     controller: confirmPasswordController,
                //     prefixIcon: Icons.lock,
                //     hintText: "Confirm Password",
                //     textFieldColor: Colors.white,
                //     isObscure: true,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter required fields";
                //       } else if (confirmPasswordController.text !=
                //           initailPasswordController.text) {
                //         return "Re-enter your password";
                //       } else {
                //         return null;
                //       }
                //     }),
                CommonTextField(
                    controller: TextEditingController(),
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
                    controller: TextEditingController(),
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
                    // problem is in passwordController.text
                    print(emailController.text);
                    if (_formKey.currentState!.validate()) {
                      SignUp(emailController.text, passwordController.text);
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
