import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouteHelper {
  static GoRoute createRoute({required String path, required Widget child}) {
    return GoRoute(
      path: path,
      builder: (context, state) {
        final rootcontext =
            context.findRootAncestorStateOfType<NavigatorState>()?.context;
        if (rootcontext != null) context = rootcontext;
        return child;
      },
    );
  }
}
