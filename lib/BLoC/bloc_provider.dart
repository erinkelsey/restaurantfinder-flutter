import 'package:flutter/material.dart';

import './bloc.dart';

/// Generic provider class for a BLoC
///
/// Must pass in the [child] widget that is wrapped by provider, which needs
/// the data from provider, and the [bloc] that is providing the data.
class BlocProvider<T extends Bloc> extends StatefulWidget {
  /// Child widget for this widget
  final Widget child;

  /// The bloc for this provider
  final T bloc;

  const BlocProvider({
    Key key,
    @required this.bloc,
    @required this.child,
  }) : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    // final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  // static Type _providerType<T>() => T;

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
