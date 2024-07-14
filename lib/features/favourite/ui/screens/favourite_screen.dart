import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import MaterialApp to use ListView
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';
import 'package:food_delivery_app/features/dashboard/resources/food_repository.dart';
import 'package:food_delivery_app/features/favourite/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) {
        List<int> favTopSaleIndex = favouriteProvider.favouriteTopSaleIndex;
        List<int> favDrinksIndex = favouriteProvider.favouriteDrinksIndex;
        List<int> favDessertIndex = favouriteProvider.favouriteDessertsIndex;
        List<int> favChickenItemIndex =
            favouriteProvider.favouriteChickenItemIndex;
        List<String> favBurgerIds = favouriteProvider.favouriteBurgerIds;

        List<Widget> favItems = [];
        for (int index in favTopSaleIndex) {
          favItems.add(
            CommonItemListCard(
              onFavouriteIconPressed: () {
                favouriteProvider.toogleFavouriteTopSaleIndex(index);
              },
              imageUrl: FoodRepository.topsaleFooddetailList[index]["imageUrl"],
              foodName: FoodRepository.topsaleFooddetailList[index]["foodName"],
              restaurantName: FoodRepository.topsaleFooddetailList[index]
                  ["restaurantName"],
              price: FoodRepository.topsaleFooddetailList[index]["price"],
              isFavourite: favouriteProvider.isFavouriteTopSale(index),
            ),
          );
        }
        for (int index in favDrinksIndex) {
          favItems.add(
            CommonItemListCard(
              onFavouriteIconPressed: () {
                favouriteProvider.toogleFavouriteDrinksIndex(index);
              },
              imageUrl: FoodRepository.drinksList[index]["imageUrl"],
              foodName: FoodRepository.drinksList[index]["foodName"],
              restaurantName: FoodRepository.drinksList[index]
                  ["restaurantName"],
              price: FoodRepository.drinksList[index]["price"],
              isFavourite: favouriteProvider.isFavouriteDrinks(index),
            ),
          );
        }
        for (int index in favDessertIndex) {
          favItems.add(
            CommonItemListCard(
              onFavouriteIconPressed: () {
                favouriteProvider.toogleFavouriteDessertsIndex(index);
              },
              imageUrl: FoodRepository.dessertItemList[index]["imageUrl"],
              foodName: FoodRepository.dessertItemList[index]["foodName"],
              restaurantName: FoodRepository.dessertItemList[index]
                  ["restaurantName"],
              price: FoodRepository.dessertItemList[index]["price"],
              isFavourite: favouriteProvider.isFavouriteDesserts(index),
            ),
          );
        }

        for (int index in favChickenItemIndex) {
          favItems.add(
            CommonItemListCard(
              onFavouriteIconPressed: () {
                favouriteProvider.toogleFavouriteChickenItemIndex(index);
              },
              imageUrl: FoodRepository.chickenItemList[index]["imageUrl"],
              foodName: FoodRepository.chickenItemList[index]["foodName"],
              restaurantName: FoodRepository.chickenItemList[index]
                  ["restaurantName"],
              price: FoodRepository.chickenItemList[index]["price"],
              isFavourite: favouriteProvider.isFavouriteChickenItem(index),
            ),
          );
        }

        for (String burgerId in favBurgerIds) {
          favItems.add(StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Burgers")
                .doc(burgerId)
                .snapshots(),
            builder: ((context, snapshot) {
              try {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Constants.primaryColor,
                  ));
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return Consumer<FavouriteProvider>(
                      builder: (context, FavouriteProvider, child) {
                        var burgerItem = snapshot.data!;
                        return CommonItemListCard(
                            onFavouriteIconPressed: () {
                              FavouriteProvider.toogleFavouriteBurgerIds(
                                  burgerId);
                            },
                            isFavourite:
                                FavouriteProvider.isFavouriteBurger(burgerId),
                            imageUrl: burgerItem["imageUrl"],
                            foodName: burgerItem["itemName"],
                            restaurantName: burgerItem["restaurant"],
                            price: burgerItem["price"]);
                      },
                    );
                  } else {
                    return Center(child: Text("Failed to load data"));
                  }
                } else {
                  return Center(child: Text("Error occurred"));
                }
              } catch (e) {
                return Center(child: Text(e.toString()));
              }
            }),
          ));
        }

        // Return ListView widget with favItems
        return ListView(
          children: favItems,
        );
      },
    );
  }
}
