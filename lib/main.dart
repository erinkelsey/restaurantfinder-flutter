import 'package:flutter/material.dart';

void main() => runApp(RestaurantFinder());

class RestaurantFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Container(),
    );
  }
}
