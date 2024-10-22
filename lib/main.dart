import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_delivery_app/features/cart/ui/screens/add%20_to_cart_screen.dart';
import 'package:food_delivery_app/features/checkout/ui/screens/check_out_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/bottom_navigation_screens/home_screen.dart';
import 'package:food_delivery_app/features/authentication/ui/screens/login_screen.dart';
import 'package:food_delivery_app/features/authentication/ui/screens/register_screen.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:food_delivery_app/features/splash/ui/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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
  FlutterNativeSplash.remove();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProvider>(
          create: (_) => FavouriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            textTheme: GoogleFonts.oswaldTextTheme(
              Theme.of(context).textTheme,
            )),
        home: DashBoardScreen(),
      ),
    );
  }
}
