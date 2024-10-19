import 'package:flutter/material.dart';

abstract class CoreUtils {
  const CoreUtils();

  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.light
        ? lightModeColour
        : darkModeColour;
  }
}
