import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/services/injection_container.dart';
import 'package:dbestech_ecomly/core/services/router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
    return MaterialApp.router(
      title: 'Ecomly',
      routerConfig: router,
      theme: theme,
      themeMode: ThemeMode.system,
      darkTheme: theme.copyWith(
          scaffoldBackgroundColor: Colours.darkThemeBGDark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colours.darkThemeBGDark,
            foregroundColor: Colours.lightThemeWhiteColour,
          )),
    );
  }
}
