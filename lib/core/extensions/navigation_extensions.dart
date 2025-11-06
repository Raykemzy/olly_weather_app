import 'package:flutter/material.dart';

// Lightweight navigation extensions
extension NavigationExt on BuildContext {
  Future<T?> push<T extends Object?>(Route<T> route) {
    return Navigator.of(this).push<T>(route);
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void pop<T>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }
}
