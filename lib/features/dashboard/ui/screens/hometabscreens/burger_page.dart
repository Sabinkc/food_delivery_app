import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/constants.dart';
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';

class BurgerPage extends StatefulWidget {
  const BurgerPage({super.key});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Burgers").snapshots(),
        builder: ((context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ));
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      return CommonItemListCard(
                          imageUrl: snapshot.data!.docs[index]["imageUrl"],
                          foodName: snapshot.data!.docs[index]["itemName"],
                          restaurantName: snapshot.data!.docs[index]
                              ["restaurant"],
                          price: snapshot.data!.docs[index]["price"]);
                    }));
              } else {
                return Center(child: Text("Failed to load data"));
              }
            } else {
              return Center(child: Text("Error occurred"));
            }
          } catch (e) {
            return Center(child: Text(e.toString()));
          }
        }));
  }
}
