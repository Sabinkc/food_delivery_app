import 'package:badges/badges.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Badge(
        badgeContent: Text("1"),
        badgeStyle: BadgeStyle(badgeColor: Colors.red),
        child: Icon(Icons.shopping_cart),
      )),
    );
  }
}
