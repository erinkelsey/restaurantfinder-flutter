/// Class for a Zomato location details.
class Location {
  final int id;
  final String type;
  final String title;

  /// Deserialize the location data into this object.
  Location.fromJson(Map json)
      : id = json['entity_id'],
        type = json['entity_type'],
        title = json['title'];
}
