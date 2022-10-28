import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/restaurant_list_page.dart';
import 'package:flutter_restaurant_app/ui/account_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  Widget _buildBodyPage(){
    switch (bottomNavIndex){
      case 0:
        return RestaurantList();
      case 1:
        return AccountPage();
      default:
        return RestaurantList();
    }
  }

  Widget _buildBottomNavBar(){
    return BottomNavigationBar(
      currentIndex: bottomNavIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Restaurant',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account'
        ),
      ],
      onTap: (selected){
        setState(() {
          bottomNavIndex = selected;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyPage(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}

