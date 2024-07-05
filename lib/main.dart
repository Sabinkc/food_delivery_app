import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/add%20_to_cart_screen.dart';
import 'package:food_delivery_app/screens/check_out_screen.dart';
import 'package:food_delivery_app/screens/dashboard_screen.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/home_screen.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import 'package:food_delivery_app/screens/register_screen.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAVVmHv7poSAUpu4LWqX_8ZwyrK0WX3vKc",
            appId: "1:777924299921:web:a0708e478fa19c03098330",
            messagingSenderId: "777924299921",
            projectId: "fooddeliveryapp-777"));
  }
  await Firebase.initializeApp();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple,
          textTheme: GoogleFonts.oswaldTextTheme(
            Theme.of(context).textTheme,
          )),
      home: SplashScreen(),
    );
  }
}
