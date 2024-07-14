import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/hometabscreens/burger_page.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/hometabscreens/chicken_page.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/hometabscreens/dessert_page.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/hometabscreens/drinks_page.dart';

import '../../../../../common/constants.dart';
import '../hometabscreens/top_sale_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 5, vsync: this);

  int selectedIndex = 0;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          color: Constants.primaryColor,
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Top Sales",
                ),
                Tab(
                  text: "Drinks",
                ),
                Tab(
                  text: "Chicken",
                ),
                Tab(
                  text: "Desserts",
                ),
                Tab(
                  text: "Burgers",
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            TopSalePage(),
            DrinkPage(),
            ChickenPage(),
            DessertPage(),
            BurgerPage(),
          ]),
        ),
      ],
    ));
  }
}
