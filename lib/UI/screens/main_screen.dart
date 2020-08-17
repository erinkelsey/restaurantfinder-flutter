import 'package:flutter/material.dart';

import './location_screen.dart';
import '../../DataLayer/location.dart';
import '../../BLoC/bloc_provider.dart';
import '../../BLoC/location_bloc.dart';

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

          return Container();
        });
  }
}
