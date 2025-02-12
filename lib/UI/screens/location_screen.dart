import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';

import '../../BLoC/location_query_bloc.dart';
import '../../BLoC/location_bloc.dart';
import '../../DataLayer/location.dart';

/// Widget for building the location screen.
class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;
  const LocationScreen({
    Key key,
    this.isFullScreenDialog = false,
  }) : super(key: key);

  /// Build the basic scaffold for the screen.
  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();

    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
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
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }

  /// Widget for the streambuilder for results.
  ///
  /// If there are results build the results with [_buildSearchResults].
  /// If there are no results, dispaly a message.
  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return Center(
            child: Text('Enter a location'),
          );
        }

        return _buildSearchResults(results);
      },
    );
  }

  /// Widget for building the search results in a list of [ListTile] objects.
  Widget _buildSearchResults(List<Location> results) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: results.length,
    );
  }
}
