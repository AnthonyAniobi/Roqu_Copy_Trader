import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
  TextTheme get textStyle => Theme.of(this).textTheme;
}
