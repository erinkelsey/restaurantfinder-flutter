import 'dart:async';

import './bloc.dart';
import '../DataLayer/location.dart';

/// BLoC component for a [Location] object.
class LocationBloc implements Bloc {
  /// The current location.
  Location _location;

  /// Getter for returnging the current location.
  Location get selectedLocation => _location;

  /// Controller for this BLoC, which keeps track of the current location.
  final _locationController = StreamController<Location>();

  /// Getter for retreiving the BLoC component stream.
  Stream<Location> get locationStream => _locationController.stream;

  /// Method to select a location as the current location.
  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  /// Dispose of the [StreamController].
  @override
  void dispose() {
    _locationController.close();
  }
}
