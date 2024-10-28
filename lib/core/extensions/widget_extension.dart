import 'package:dbestech_ecomly/core/common/widgets/dynamic_loader_widget.dart';
import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  DynamicLoaderWidget loading(bool isLoading) {
    return DynamicLoaderWidget(originalWidget: this, isLoading: isLoading);
  }
}
