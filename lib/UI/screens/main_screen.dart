import 'package:flutter/material.dart';

import './location_screen.dart';
import './restaurant_screen.dart';
import '../../DataLayer/location.dart';
import '../../BLoC/bloc_provider.dart';
import '../../BLoC/location_bloc.dart';

/// Widget for building the main app screen.
///
/// Goes to [LocationScreen] if there is no [location] specified; else goes
/// to [RestaurantScreen].
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }

        return RestaurantScreen(location: location);
      },
    );
  }
}
