import 'package:flutter/material.dart';

// Lightweight navigation extensions
extension NavigationExt on BuildContext {
  Future<T?> push<T extends Object?>(Route<T> route) {
    return Navigator.of(this).push<T>(route);
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return Navigator.of(this).pushReplacement<T, TO>(newRoute, result: result);
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void pop<T>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }
}
