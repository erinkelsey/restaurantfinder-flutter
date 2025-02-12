/// Class for the details for a specific Zomato restaurant.
class Restaurant {
  final String id;
  final String name;
  final String url;
  final String currency;
  final String thumbUrl;
  final String imageUrl;
  final String cuisines;
  final String address;
  final Rating rating;

  final int priceRange;

  /// Getter for displaying the price in a nice format.
  String get priceDisplay {
    final buffer = StringBuffer();
    for (int i = 0; i < priceRange; i++) {
      buffer.write(currency);
    }
    return buffer.toString();
  }

  /// Deserialize JSON into this object.
  Restaurant.fromJson(json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        thumbUrl = json['thumb'],
        imageUrl = json['featured_image'],
        priceRange = json['price_range'],
        currency = json['currency'],
        cuisines = json['cuisines'],
        address = json['location']['address'],
        rating = Rating.fromJson(json['user_rating']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Restaurant && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Class for the ratings for a specific Zomato restaurant.
class Rating {
  final String text;
  final String average;

  /// Deserialize the rating info to this object.
  Rating.fromJson(Map json)
      : text = json['rating_text'].toString(),
        average = json['aggregate_rating'].toString();
}
