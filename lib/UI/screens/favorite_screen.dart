import 'package:flutter/material.dart';

import '../../BLoC/bloc_provider.dart';
import '../../BLoC/favorite_bloc.dart';
import '../../DataLayer/restaurant.dart';
import '../../UI/widgets/restaurant_tile.dart';

/// Widget for building the screen that shows the user's favorites.
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: StreamBuilder<List<Restaurant>>(
        stream: bloc.favoritesStream,
        initialData: bloc.favorites,
        builder: (context, snapshot) {
          List<Restaurant> favorites =
              (snapshot.connectionState == ConnectionState.waiting)
                  ? bloc.favorites
                  : snapshot.data;

          if (favorites == null || favorites.isEmpty) {
            return Center(
              child: Text('No Favorites'),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) {
                final restaurant = favorites[index];
                return RestaurantTile(restaurant: restaurant);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: favorites.length);
        },
      ),
    );
  }
}
