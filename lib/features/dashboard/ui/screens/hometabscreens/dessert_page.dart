import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widgets/common_item_list_card.dart';
import '../../../resources/food_repository.dart';

class DessertPage extends StatelessWidget {
  const DessertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, FavouriteProvider, child) {
        return ListView.builder(
            itemCount: FoodRepository.dessertItemList.length,
            itemBuilder: (context, index) {
              return CommonItemListCard(
                  onFavouriteIconPressed: () {
                    FavouriteProvider.toogleFavouriteDessertsIndex(index);
                  },
                  imageUrl: FoodRepository.dessertItemList[index]["imageUrl"],
                  foodName: FoodRepository.dessertItemList[index]["foodName"],
                  restaurantName: FoodRepository.dessertItemList[index]
                      ["restaurantName"],
                  price: FoodRepository.dessertItemList[index]["price"],
                  isFavourite: FavouriteProvider.isFavouriteDesserts(index));
            });
      },
    );
  }
}
