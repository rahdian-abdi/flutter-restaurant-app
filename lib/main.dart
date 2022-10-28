import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/restaurant_detail_page.dart';
import 'package:flutter_restaurant_app/ui/home_page.dart';
import 'package:flutter_restaurant_app/data/source.dart';
import 'package:flutter_restaurant_app/common/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                textStyle: TextStyle(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))
                ),
            ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName:(context) => HomePage(),
        RestaurantDetail.routeName:(context) =>
            RestaurantDetail(theRestaurantDetail:
            ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
