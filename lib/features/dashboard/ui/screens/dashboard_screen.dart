import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/bottom_navigation_screens/cart_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/bottom_navigation_screens/checkout_history_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/bottom_navigation_screens/favourite_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/bottom_navigation_screens/home_screen.dart';
import 'package:food_delivery_app/features/dashboard/ui/screens/hometabscreens/burger_page.dart';

import '../../../../common/constants.dart';
import '../../../search/ui/screens/search_screen.dart';
import 'hometabscreens/top_sale_page.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SearchScreen())));
              },
              icon: Icon(Icons.search))
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu));
        }),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                color: Constants.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.grey,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ))),
                    Text(
                      "abcd@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              ListTile(
                textColor: Colors.grey,
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                title: Text(
                  "Home",
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ),
              Divider(),
              ListTile(
                textColor: Colors.grey,
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                title: Text(
                  "Profile",
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ),
              Divider(),
              ListTile(
                textColor: Colors.grey,
                leading:
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                title: Text(
                  "Settings",
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ),
              Divider(),
              ListTile(
                textColor: Colors.grey,
                leading: IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications)),
                title: Text(
                  "Notifications",
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ),
              Divider(),
            ],
          ),
        ),
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
