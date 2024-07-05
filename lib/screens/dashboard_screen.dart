import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/cart_screen.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/checkout_history_screen.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/favourite_screen.dart';
import 'package:food_delivery_app/screens/bottom_navigation_pages/home_screen.dart';
import 'package:food_delivery_app/screens/hometabpages/burger_page.dart';

import '../common/constants.dart';
import 'hometabpages/top_sale_page.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 6, vsync: this);

  int selectedIndex = 0;

  List<Widget> bottomNavigationScreenList = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    CheckOutHistoryScreen()
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FreshEats"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: bottomNavigationScreenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Constants.primaryColor,
          unselectedItemColor: Colors.grey,
          iconSize: 28,
          currentIndex: selectedIndex,
          elevation: 10,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                label: "Favourites",
                icon: Icon(Icons.favorite_outline_outlined)),
            BottomNavigationBarItem(
                label: "Cart",
                icon: Icon(
                  Icons.shopping_cart,
                )),
            BottomNavigationBarItem(
                label: "History",
                icon: Icon(
                  Icons.history,
                )),
          ]),
    );
  }
}
