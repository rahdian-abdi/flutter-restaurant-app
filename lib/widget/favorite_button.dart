import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false; //make first statement

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5),
      child: CircleAvatar(
        radius: 15.0,
        backgroundColor: Colors.white,
        child: IconButton(
            padding: EdgeInsets.only(right: 1.0, top: 1.0),
            onPressed: (){
              setState(() { //to change when you call it, state state
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline, color: Colors.red,)
        ),
      ),
    );
  }
}