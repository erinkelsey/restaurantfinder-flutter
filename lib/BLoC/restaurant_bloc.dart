import 'dart:async';

import './bloc.dart';
import '../DataLayer/location.dart';
import '../DataLayer/restaurant.dart';
import '../DataLayer/zomato_client.dart';

/// BLoC component for [Restaurant] objects.
class RestaurantBloc implements Bloc {
  /// Location to search restaurants in.
  final Location location;

  /// Client for performing API requests.
  final _client = ZomatoClient();

  /// Controller for this BLoC, which keeps track of a list of [Restaurant] objects.
  final _controller = StreamController<List<Restaurant>>();

  /// Getter for retrieving the BLoC component stream.
  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  /// Method for submitting the query to this BLoC.
  ///
  /// Must have the [query] data for searching restaurants.
  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  /// Dispose of the [StreamController].
  @override
  void dispose() {
    _controller.close();
  }
}
