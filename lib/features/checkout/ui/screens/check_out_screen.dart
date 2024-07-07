import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/widgets/common_button.dart';
import 'package:food_delivery_app/common/widgets/common_checkout_itemlistcard.dart';
import 'package:food_delivery_app/common/widgets/common_textfield.dart';
import 'package:food_delivery_app/common/constants.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundGreyColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                  CommonCheckoutItemListCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      foodName: "Veggie Burger",
                      restaurantName: "Fresh Eats",
                      price: "400"),
                  CommonCheckoutItemListCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      foodName: "Veggie Burger",
                      restaurantName: "Fresh Eats",
                      price: "400"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Text(
                              "Rs.400",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery charge",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Text(
                              "Rs.50",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Text(
                              "10%",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        CommonTextField(
                            controller: TextEditingController(),
                            prefixIcon: Icons.details,
                            hintText: "Enter your number",
                            textFieldColor: Colors.grey.withOpacity(0.1),
                            isObscure: false,
                            validator: (value) {}),
                        CommonTextField(
                            controller: TextEditingController(),
                            prefixIcon: Icons.place,
                            hintText: "Enter your address",
                            textFieldColor: Colors.grey.withOpacity(0.1),
                            isObscure: false,
                            validator: (value) {}),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Rs.450",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  CommonButton(
                      horizontalPadding: 110,
                      buttonText: "Confirm Order",
                      buttonColor: Constants.primaryColor,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  backgroundColor: Constants.primaryColor,
                                  titlePadding:
                                      EdgeInsets.symmetric(vertical: 60),
                                  title: Center(
                                      child: Text(
                                    "Order confirmed successfully!",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )));
                      })
                ]),
          ),
        ),
      ),
    );
  }
}
