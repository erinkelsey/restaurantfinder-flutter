import 'package:flutter/material.dart';

import '../../DataLayer/location.dart';
import '../../DataLayer/restaurant.dart';
import '../../BLoC/restaurant_bloc.dart';
import '../../BLoC/bloc_provider.dart';
import '../widgets/restaurant_tile.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;

  const RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(location);

    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What do you want to eat?",
              ),
              onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(
            child: _buildStreamBuilder(bloc),
          ),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return Center(
            child: Text('Enter a restaurant name or cuisine type'),
          );
        }

        if (results.isEmpty) {
          return Center(
            child: Text('No Resulsts'),
          );
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final restaurant = results[index];
          return RestaurantTile(restaurant: restaurant);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: results.length);
  }
}
