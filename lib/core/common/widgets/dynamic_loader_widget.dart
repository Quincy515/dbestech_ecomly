import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:flutter/material.dart';

class DynamicLoaderWidget extends StatelessWidget {
  const DynamicLoaderWidget({
    super.key,
    required this.originalWidget,
    required this.isLoading,
    this.loadingWidget,
  });

  final Widget originalWidget;
  final bool isLoading;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingWidget ??
            const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colours.lightThemePrimaryColour,
              ),
            )
        : originalWidget;
  }
}
