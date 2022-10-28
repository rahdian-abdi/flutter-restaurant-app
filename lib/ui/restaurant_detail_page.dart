import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/widget/favorite_button.dart';
import 'package:flutter_restaurant_app/data/source.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant theRestaurantDetail;
  RestaurantDetail({
    required this.theRestaurantDetail
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            theRestaurantDetail.name,
            style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart, color: Colors.black,))
        ],
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Hero(
                  tag: theRestaurantDetail.pictureId,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(theRestaurantDetail.pictureId),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 175),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                            color: Colors.white
                        ),
                        padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      theRestaurantDetail.name,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow,),
                                    Text(theRestaurantDetail.rating.toString())
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                Text(theRestaurantDetail.city)
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Text(
                                'Hello There!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(height: 5),
                            Text(
                                theRestaurantDetail.description,
                                textAlign: TextAlign.justify),
                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'Check Our Dishes!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  SizedBox(height: 10.0),
                                  Text('Foods', style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10.0),
                                  Container(
                                    height: 175,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: theRestaurantDetail.menus.foods.map((food) =>
                                          Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  height: 100,
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                        child: Image.asset('asset/food_image.jpg'),
                                                      ),
                                                      FavoriteButton()
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15.0),
                                                Text(food.name),
                                                SizedBox(height: 5.0),
                                                Text('IDR???')
                                              ],
                                            ),
                                          )
                                      ).toList(),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text('Drinks', style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10.0),
                                  Container(
                                    height: 175,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: theRestaurantDetail.menus.drinks.map((drink) =>
                                          Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 100,
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                          child: Image.asset('asset/food_image.jpg'),
                                                        ),
                                                        FavoriteButton()
                                                      ],
                                                    )
                                                ),
                                                SizedBox(height: 15.0),
                                                Text(drink.name),
                                                SizedBox(height: 5.0),
                                                Text('IDR???'),
                                              ],
                                            ),
                                          )
                                      ).toList(),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
