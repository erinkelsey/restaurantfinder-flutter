import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Where do you want to eat?'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a location',
              ),
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: _buildResults(),
          )
        ],
      ),
    );
  }

  Widget _buildResults() {
    return Center(
      child: Text('Enter a location'),
    );
  }
}
