import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/features/authentication/ui/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future navigateToLoginscreen() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: ((context) => LogInScreen())));
  }

  @override
  void initState() {
    navigateToLoginscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 130,
              color: Colors.white,
            ),
            Text(
              "FreshEats",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(color: Colors.white, fontSize: 50)),
            )
          ],
        ),
      ),
    );
  }
}