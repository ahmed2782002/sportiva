// Flutter imports:


import 'package:flutter/material.dart';

class AppContext {
  AppContext._();

  static final AppContext instance = AppContext._();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context {
    if (navigatorKey.currentContext == null) {
      throw Exception('Context is not Available yet!');
    } else {
      return navigatorKey.currentContext!;
    }
  }
}
