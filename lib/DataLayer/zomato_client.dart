import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'location.dart';
import 'restaurant.dart';

/// Class for the Zomato client.
///
/// Responsible for handling the API requests to the Zomato API.
/// Must have set the [ZOMATO_API_KEY] when running/building the app.
class ZomatoClient {
  /// The private API Key used to access the Zomato API.
  static const _apiKey = String.fromEnvironment('ZOMATO_API_KEY');

  /// The URL for the Zomato API.
  final _host = 'developers.zomato.com';
  final _contextRoot = 'api/v2.1';

  /// Method for fetching locations from API.
  ///
  /// Must include the [query] for searching for locations that match.
  Future<List<Location>> fetchLocations(String query) async {
    final results = await request(
        path: 'locations', parameters: {'query': query, 'count': '10'});

    final suggestions = results['location_suggestions'];
    return suggestions
        .map<Location>((json) => Location.fromJson(json))
        .toList(growable: false);
  }

  /// Method for fetching the restaurants from API.
  ///
  /// Must include the [location] to fetch restaurants from and the [query] for
  /// the type of restaurant or food to search for in [location].
  Future<List<Restaurant>> fetchRestaurants(
      Location location, String query) async {
    final results = await request(path: 'search', parameters: {
      'entity_id': location.id.toString(),
      'entity_type': location.type,
      'q': query,
      'count': '10'
    });

    final restaurants = results['restaurants']
        .map<Restaurant>((json) => Restaurant.fromJson(json['restaurant']))
        .toList(growable: false);

    return restaurants;
  }

  /// Method for making the request to the Zomato API server.
  ///
  /// Must include the [path] for the request, and the [parameters] to add to the request.
  /// Returns a decoded JSON object for serialization.
  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  /// Private getter for constructing the HTTP Request Headers with the API Key
  /// and request type.
  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'user-key': _apiKey};
}
