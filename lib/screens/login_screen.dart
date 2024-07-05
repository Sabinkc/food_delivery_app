import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/home_screen.dart';
import 'package:food_delivery_app/screens/register_screen.dart';
import '../common/common_button.dart';
import '../common/common_password_textfield.dart';
import '../common/common_textfield.dart';
import '../common/constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.food_bank,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "FreshEats",
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
                    return "Enter a valid email address";
                  } else {
                    return null;
                  }
                },
              ),
              CommonPasswordTextField(
                controller: TextEditingController(),
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
                },
              ),
              SizedBox(
                height: 10,
              ),
              CommonButton(
                buttonText: "Login",
                buttonColor: Colors.red,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => HomeScreen())));
                  }
                  print("common button pressed");
                },
              ),
              SizedBox(
                height: 50,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New user?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => RegisterScreen())));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
