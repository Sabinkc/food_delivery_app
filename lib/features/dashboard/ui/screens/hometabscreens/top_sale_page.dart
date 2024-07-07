import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';

class TopSalePage extends StatefulWidget {
  const TopSalePage({super.key});

  @override
  State<TopSalePage> createState() => _TopSalePageState();
}

class _TopSalePageState extends State<TopSalePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) => CommonItemListCard(
            imageUrl:
                "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            foodName: "Vegetable Burger",
            restaurantName: "Burgerhub",
            price: "500")));
  }
}


// Container(
//             height: 120,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.7),
//                       offset: Offset(2, 2)),
//                 ]),
//             padding: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//                     height: 100,
//                     width: 120,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(top: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Vegetable Burger",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       Text(
//                         "In Burgerhub",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       Text(
//                         "Price: Rs.500",
//                         style: TextStyle(fontSize: 20),
//                       )
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.add,
//                       color: Colors.grey,
//                     ))
//               ],
//             ),
//           ),