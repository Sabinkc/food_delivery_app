import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';
import 'package:food_delivery_app/features/dashboard/resources/food_repository.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, FavouriteProvider, index) {
        return ListView.builder(
            itemCount: FoodRepository.drinksList.length,
            itemBuilder: (context, index) {
              return CommonItemListCard(
                  onFavouriteIconPressed: () {
                  FavouriteProvider.toogleFavouriteDrinksIndex(index);
                  },
                  imageUrl: FoodRepository.drinksList[index]["imageUrl"],
                  foodName: FoodRepository.drinksList[index]["foodName"],
                  restaurantName: FoodRepository.drinksList[index]
                      ["restaurantName"],
                  price: FoodRepository.drinksList[index]["price"],
                  isFavourite: FavouriteProvider.isFavouriteDrinks(index));
            });
      },
    );
  }
}




