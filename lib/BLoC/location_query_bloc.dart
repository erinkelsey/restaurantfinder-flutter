import 'dart:async';

import './bloc.dart';
import '../DataLayer/zomato_client.dart';
import '../DataLayer/location.dart';

/// BLoC component for the query that
class LocationQueryBloc implements Bloc {
  /// Controller for this BLoC, which keeps track of a list of [Location] objects.
  final _controller = StreamController<List<Location>>();

  /// Client for performing API requests.
  final _client = ZomatoClient();

  /// Getter for retreiving the [StreamController] stream for the current location.
  Stream<List<Location>> get locationStream => _controller.stream;

  /// Method for submitting the query to this BLoC.
  ///
  /// Must have the [query] string for searching for locations.
  void submitQuery(String query) async {
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  /// Dispose of the [StreamController].
  @override
  void dispose() {
    _controller.close();
  }
}
