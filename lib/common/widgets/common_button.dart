import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final void Function()? onTap;
  final double horizontalPadding;
  const CommonButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.onTap,
      this.horizontalPadding = 70});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 2,
                  offset: Offset(3, 3),
                  blurStyle: BlurStyle.normal)
            ]),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
