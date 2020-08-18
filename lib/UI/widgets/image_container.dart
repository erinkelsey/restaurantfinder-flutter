import 'package:flutter/material.dart';

/// Widget for building an image in a container.
///
/// Must specify the [url], where the image is located, and it must be
/// a network resource.
class ImageContainer extends StatelessWidget {
  /// Width for this container.
  final double width;

  /// Height for this container.
  final double height;

  /// Color for background of container, used as a placeholder until the
  /// image is retrieved and displayed.
  final Color placeholder;

  /// The url for the location of the image. Must be a network location.
  final String url;

  const ImageContainer(
      {Key key,
      this.width,
      this.height,
      this.placeholder = const Color(0xFFEEEEEE),
      @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: placeholder,
          image: url.contains("http")
              ? DecorationImage(image: NetworkImage(url))
              : null),
    );
  }
}
