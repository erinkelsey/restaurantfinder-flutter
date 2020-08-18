import 'package:flutter/material.dart';

import '../../DataLayer/location.dart';
import '../../DataLayer/restaurant.dart';
import '../../BLoC/restaurant_bloc.dart';
import '../../BLoC/bloc_provider.dart';
import '../widgets/restaurant_tile.dart';
import './favorite_screen.dart';
import './location_screen.dart';

/// Widget for rendering the screen which shows the list of [Restaurant] objects
/// in a specific [Location].
class RestaurantScreen extends StatelessWidget {
  /// The location to search restaurants.
  final Location location;

  const RestaurantScreen({Key key, @required this.location}) : super(key: key);

  /// Build the main scaffold for page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FavoriteScreen(),
              ),
            ),
          ),
        ],
      ),
      body: _buildSearch(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_location),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LocationScreen(
              isFullScreenDialog: true,
            ),
            fullscreenDialog: true,
          ),
        ),
      ),
    );
  }

  /// Build the search bar for the page.
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

  /// Build the results based on the data in [RestaurantBloc].
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

  /// Build the list of results from the search.
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
