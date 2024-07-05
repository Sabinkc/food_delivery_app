import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/common_button.dart';
import 'package:food_delivery_app/common/constants.dart';

class AddtoCartScreen extends StatelessWidget {
  const AddtoCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline))
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "In FreshEats",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "Veggie Burger",
                style: TextStyle(fontSize: 25, color: Constants.primaryColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text("4.6")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            shadows: [
                              BoxShadow(
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  color: Colors.red.withOpacity(0.5),
                                  offset: Offset(1, 1)),
                            ],
                          )),
                      Text("1"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            shadows: [
                              BoxShadow(
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  color: Colors.red.withOpacity(0.5),
                                  offset: Offset(1, 1)),
                            ],
                          ))
                    ]),
                  )
                ],
              ),
              Text(
                "Food Info",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "A veggie burger is a hamburger made with a patty that does not contain meat, or the patty of such a hamburger. The patty may be made from ingredients like beans (especially soybeans and tofu), nuts, grains, seeds, or fungi such as mushrooms or mycoprotein.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rs.500",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonButton(
                      horizontalPadding: 35,
                      buttonText: "Add To Cart",
                      buttonColor: Constants.primaryColor,
                      onTap: () {}),
                  CommonButton(
                      horizontalPadding: 35,
                      buttonText: "Buy Now",
                      buttonColor: Constants.primaryColor,
                      onTap: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
