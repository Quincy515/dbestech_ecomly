import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Colours.lightThemePrimaryColour),
      fontFamily: 'Switzer',
      scaffoldBackgroundColor: Colours.lightThemeTintStockColour,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colours.lightThemeTintStockColour,
          foregroundColor: Colours.lightThemePrimaryTextColour),
      useMaterial3: true,
    );
    return MaterialApp(
      title: 'Ecomly',
      theme: theme,
      themeMode: ThemeMode.system,
      darkTheme: theme.copyWith(
          scaffoldBackgroundColor: Colours.darkThemeBGDark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colours.darkThemeBGDark,
            foregroundColor: Colours.lightThemeWhiteColour,
          )),
      home: Scaffold(
        body: Center(
          child: Text('Hello World!',
              style: TextStyles.headingRegular
                  .copyWith(color: Colours.classicAdaptiveTextColour(context))),
        ),
      ),
    );
  }
}