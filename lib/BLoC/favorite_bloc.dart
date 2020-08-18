import 'dart:async';

import '../DataLayer/restaurant.dart';
import './bloc.dart';

/// BLoC component for keeping track of favorite restaurants.
class FavoriteBloc implements Bloc {
  /// Private list of favorite restaurants.
  var _restaurants = <Restaurant>[];

  /// Getter for retrieving the user's favorite restaurants.
  List<Restaurant> get favorites => _restaurants;

  /// Private controller for Restaurant objects stream.
  final _controller = StreamController<List<Restaurant>>.broadcast();

  /// Getter for retrieving the favorites [StreamConroller] stream.
  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  /// Toggle a restaurant as favorite.
  ///
  /// Must specify which [Restaurant] to toggle as favorite.
  void toggleRestaurant(Restaurant restaurant) {
    if (_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }

    _controller.sink.add(_restaurants);
  }

  /// Dispose of the controller.
  @override
  void dispose() {
    _controller.close();
  }
}
