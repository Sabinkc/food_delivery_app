import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';
import 'package:food_delivery_app/features/dashboard/resources/food_repository.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class TopSalePage extends StatefulWidget {
  const TopSalePage({super.key});

  @override
  State<TopSalePage> createState() => _TopSalePageState();
}

class _TopSalePageState extends State<TopSalePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, FavouriteProvider, child) => ListView.builder(
          itemCount: FoodRepository.topsaleFooddetailList.length,
          itemBuilder: ((context, index) => CommonItemListCard(
              onFavouriteIconPressed: () {
                FavouriteProvider.toogleFavouriteTopSaleIndex(index);
              },
              isFavourite: FavouriteProvider.isFavouriteTopSale(index),
              imageUrl: FoodRepository.topsaleFooddetailList[index]["imageUrl"],
              foodName: FoodRepository.topsaleFooddetailList[index]["foodName"],
              restaurantName: FoodRepository.topsaleFooddetailList[index]
                  ["restaurantName"],
              price: FoodRepository.topsaleFooddetailList[index]["price"]))),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';
// import 'package:food_delivery_app/features/dashboard/resources/food_repository.dart';
// import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
// import 'package:provider/provider.dart';
// class TopSalePage extends StatefulWidget {
//   const TopSalePage({super.key});

//   @override
//   State<TopSalePage> createState() => _TopSalePageState();
// }

// class _TopSalePageState extends State<TopSalePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FavouriteProvider>(
//       builder: (context, favouriteProvider, child) => ListView.builder(
//         itemCount: FoodRepository.topsaleFooddetailList.length,
//         itemBuilder: (context, index) {
//           return CommonItemListCard(
//             onFavouriteIconPressed: () {
//               favouriteProvider.toggleFavouriteTopSale(index);
//             },
//             isFavourite: favouriteProvider.isFavouriteTopSale(index),
//             imageUrl: FoodRepository.topsaleFooddetailList[index]["imageUrl"],
//             foodName: FoodRepository.topsaleFooddetailList[index]["foodName"],
//             restaurantName: FoodRepository.topsaleFooddetailList[index]["restaurantName"],
//             price: FoodRepository.topsaleFooddetailList[index]["price"],
//           );
//         },
//       ),
//     );
//   }
// }
