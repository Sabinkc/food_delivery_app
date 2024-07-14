import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/common_item_list_card.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> favouriteTopSaleIndex = [];
  List<int> favouriteDrinksIndex = [];
  List<int> favouriteDessertsIndex = [];
  List<int> favouriteChickenItemIndex = [];
  List<String> favouriteBurgerIds = [];

  void toogleFavouriteTopSaleIndex(int index) {
    if (favouriteTopSaleIndex.contains(index)) {
      favouriteTopSaleIndex.remove(index);
    } else {
      favouriteTopSaleIndex.add(index);
    }
    notifyListeners();
  }

  bool isFavouriteTopSale(index) {
    return (favouriteTopSaleIndex.contains(index));
  }

  void toogleFavouriteDrinksIndex(int index) {
    if (favouriteDrinksIndex.contains(index)) {
      favouriteDrinksIndex.remove(index);
    } else {
      favouriteDrinksIndex.add(index);
    }
    notifyListeners();
  }

  bool isFavouriteDrinks(index) {
    return (favouriteDrinksIndex.contains(index));
  }

  void toogleFavouriteDessertsIndex(int index) {
    if (favouriteDessertsIndex.contains(index)) {
      favouriteDessertsIndex.remove(index);
    } else {
      favouriteDessertsIndex.add(index);
    }
    notifyListeners();
  }

  bool isFavouriteDesserts(index) {
    return (favouriteDessertsIndex.contains(index));
  }

  void toogleFavouriteChickenItemIndex(int index) {
    if (favouriteChickenItemIndex.contains(index)) {
      favouriteChickenItemIndex.remove(index);
    } else {
      favouriteChickenItemIndex.add(index);
    }
    notifyListeners();
  }

  bool isFavouriteChickenItem(index) {
    return (favouriteChickenItemIndex.contains(index));
  }

  void toogleFavouriteBurgerIds(String burgerId) {
    if (favouriteBurgerIds.contains(burgerId)) {
      favouriteBurgerIds.remove(burgerId);
    } else {
      favouriteBurgerIds.add(burgerId);
    }
    notifyListeners();
  }

  bool isFavouriteBurger(burgerId) {
    return (favouriteBurgerIds.contains(burgerId));
  }
}
