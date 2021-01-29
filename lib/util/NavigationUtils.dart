import 'package:flutter/material.dart';

class Navigate {
  static Future<dynamic> to(
    BuildContext context,
    Widget destination,
    String route, {
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool removePreviousPages = false,
  }) {

    var pageRoute = MaterialPageRoute(
      builder: (_) => destination,
      maintainState: maintainState,
      settings: settings ?? RouteSettings(name: route),
      fullscreenDialog: fullscreenDialog,
    );

    if (removePreviousPages) {
      return Navigator.pushAndRemoveUntil(
        context,
        pageRoute,
        (Route<dynamic> route) => false,
      );
    } else {
      return Navigator.push(context, pageRoute);
    }
  }
}