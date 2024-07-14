import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widgets/common_item_list_card.dart';
import '../../../resources/food_repository.dart';

class ChickenPage extends StatelessWidget {
  const ChickenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, FavouriteProvider,child){
return ListView.builder(
        itemCount: FoodRepository.chickenItemList.length,
        itemBuilder: (context, index) {
          return CommonItemListCard(
            onFavouriteIconPressed: (){
              FavouriteProvider.toogleFavouriteChickenItemIndex(index);
            },
              foodName: FoodRepository.chickenItemList[index]["foodName"],
              imageUrl: FoodRepository.chickenItemList[index]["imageUrl"],
              restaurantName: FoodRepository.chickenItemList[index]
                  ["restaurantName"],
              price: FoodRepository.chickenItemList[index]["price"],
              isFavourite: FavouriteProvider.isFavouriteChickenItem(index));
        });
    })
    ;
  }
}
