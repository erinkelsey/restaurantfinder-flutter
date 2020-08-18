/// Abstract base class for all BLoC components
abstract class Bloc {
  /// BLoC components must dispose of controllers, so that there are
  /// no memory leaks.
  void dispose();
}
