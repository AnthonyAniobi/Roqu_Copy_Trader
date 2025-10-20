import 'package:flutter/material.dart';

class NavigationBackstackNotifier extends NavigatorObserver {
  /// Notifies whether there is a route to pop (true = can go back).
  final ValueNotifier<bool> canPopNotifier = ValueNotifier<bool>(false);

  @override
  void didPush(Route route, Route? previousRoute) {
    _updateCanPop(route.navigator);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // set current route name;
    _updateCanPop(route.navigator);
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _updateCanPop(route.navigator);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _updateCanPop(newRoute?.navigator);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _updateCanPop(NavigatorState? navigator) {
    canPopNotifier.value = navigator?.canPop() ?? false;
  }

  void dispose() {
    canPopNotifier.dispose();
  }
}
