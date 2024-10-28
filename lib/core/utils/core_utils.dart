import 'package:dbestech_ecomly/core/extensions/context_extension.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColour,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        backgroundColor: backgroundColour ?? Colours.lightThemePrimaryColour,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: TextStyles.paragraphSubTextRegular1.white,
        ),
        duration: _calculateDuration(message),
      );

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }

  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    return context.isDarkMode ? darkModeColour : lightModeColour;
  }

  static void postFrameCall(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Duration _calculateDuration(String message) {
    // Average reading speed in words per minute
    const int averageWPM = 200;

    // Average word length in characters
    const int averageWordLength = 5;

    // Calculate milliseconds per character based on average reading speed
    const int millisecondsPerWord = (60 * 1000) ~/ averageWPM;
    const int millsecondsPerCharacter =
        millisecondsPerWord ~/ averageWordLength;

    // Calculate the duration based on the length of the message
    final int durationInMilliseconds = message.length * millsecondsPerCharacter;

    // Limit the duration to a reasonable maximum
    const int maxDurationMilliseconds = 5000; // 5 seconds
    final int finalDuration = durationInMilliseconds.clamp(
      1000,
      maxDurationMilliseconds,
    );

    return Duration(milliseconds: finalDuration);
  }
}
