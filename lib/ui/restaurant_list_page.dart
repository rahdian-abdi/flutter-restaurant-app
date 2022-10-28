import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/restaurant_detail_page.dart';
import 'package:flutter_restaurant_app/data/source.dart';
import 'package:flutter_restaurant_app/common/style.dart';

class RestaurantList extends StatelessWidget {
  static const routeName = 'restaurant_list';

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('asset/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final RestaurantDatabase restaurantList = restaurantDatabaseFromJson(snapshot.data!);
            return ListView.builder(
                itemCount: restaurantList.restaurants.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantList(
                      context, restaurantList.restaurants[index]);
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Error has occurred'),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(snapshot.error.toString()))
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        });
  }

  Widget _buildRestaurantList(BuildContext context, Restaurant restaurantPart) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        leading: Hero(
            tag: restaurantPart.pictureId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                restaurantPart.pictureId,
                width: 100,
                fit: BoxFit.cover,
              ),
            )
        ),
        title: Text(restaurantPart.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 12.5,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(restaurantPart.city),
              ],
            ),
            SizedBox(height: 2.5),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    size: 12.5,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 5),
                  Text(restaurantPart.rating.toString()),
                ])
          ],
        ),
        onTap: (){
          Navigator.pushNamed(context, RestaurantDetail.routeName, arguments: restaurantPart);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, scrolled){
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search, color: Colors.black,))
                ],
                pinned: true,
                expandedHeight: 250,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'asset/restaurant_background.jpg',
                    fit: BoxFit.cover, // To fit image based on width and height
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Resto', style: TextStyle(color: Colors.black),),
                      SizedBox(height: 3.0),
                      Text(
                        'Tasty meal to fix you!',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                ),
              )
            ];
          },
          body: MediaQuery.removePadding( //Remove unwanted space
            removeTop: true,
              context: context,
              child: _buildList(context)
          )
      ),
    );
  }
}

//headerSliverBuilder:(context, scrolled){
// return [
//  SliverAppBar()
//  ]
// }
//body:
