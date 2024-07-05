import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonCheckoutItemListCard extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final String restaurantName;
  final String price;
  const CommonCheckoutItemListCard(
      {super.key,
      required this.imageUrl,
      required this.foodName,
      required this.restaurantName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "In ${restaurantName}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Price: Rs.${price}",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: Colors.grey,
                  )),
              Text("1"),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
