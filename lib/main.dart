import 'package:flutter/material.dart';

import './UI/screens/main_screen.dart';

void main() => runApp(RestaurantFinder());

class RestaurantFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
    );
  }
}
