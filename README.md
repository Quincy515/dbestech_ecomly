# dbestech_ecomly

```shell
flutter create dbestech_ecomly --empty --org com.fluentspoken
cd dbestech_ecomly
mkdir assets assets/images assets/lottie assets/fonts
flutter pub add lottie && flutter pub get
cd lib && mkdir core core/common core/utils core/res core/res/styles && touch core/res/media.dart core/res/styles/colours.dart core/res/styles/text.dart core/utils/core_utiles.dart
```

在 `pubspec.yaml` 文件中添加如下内容：

```yaml
...
flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/lottie/

  fonts:
    - family: Switzer
      fonts:
        - asset: assets/fonts/Switzer-Black.otf
        - asset: assets/fonts/Switzer-BlackItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Bold.otf
        - asset: assets/fonts/Switzer-BoldItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Extrabold.otf
        - asset: assets/fonts/Switzer-ExtraboldItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Extralight.otf
        - asset: assets/fonts/Switzer-ExtralightItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Italic.otf
          style: italic
        - asset: assets/fonts/Switzer-Light.otf
        - asset: assets/fonts/Switzer-LightItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Medium.otf
        - asset: assets/fonts/Switzer-MediumItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Regular.otf
        - asset: assets/fonts/Switzer-Semibold.otf
        - asset: assets/fonts/Switzer-SemiboldItalic.otf
          style: italic
        - asset: assets/fonts/Switzer-Thin.otf
        - asset: assets/fonts/Switzer-ThinItalic.otf
          style: italic
```

在 `core/res/media.dart` 中添加如下内容：

```dart 
abstract class Media {
  const Media();

  static const _baseImage = 'assets/images';
  static const _baseLottie = 'assets/lottie';

  static const onBoardingFemale = '$_baseImage/on_boarding_female.png';
  static const onBoardingMale = '$_baseImage/on_boarding_male.png';
  static const user = '$_baseImage/user.png';

  static const search = '$_baseLottie/search.json';
  static const searchLight = '$_baseLottie/search_light.json';
  static const searching = '$_baseLottie/searching.json';
  static const error = '$_baseLottie/error.json';
  static const emptyCart = '$_baseLottie/empty_cart.json';

  /// Animated check mark for checkout completion
  static const checkMark = '$_baseLottie/check.json';
}
``` 

在 `core/res/styles/colours.dart` 中添加如下内容：

```dart
import 'package:flutter/material.dart';

abstract class Colours {
  // lightThemePrimaryTint Color Swatch
  static const Color lightThemePrimaryTint = Color(0xff9e9cdc);

  // lightThemePrimaryColor Color Swatch
  static const Color lightThemePrimaryColour = Color(0xff524eb7);

  // lightThemeSecondaryColor Color Swatch
  static const Color lightThemeSecondaryColour = Color(0xfff76631);

  // lightThemePrimaryTextColor Color Swatch
  static const Color lightThemePrimaryTextColour = Color(0xff282344);

  // lightThemeSecondaryTextColor Color Swatch
  static const Color lightThemeSecondaryTextColour = Color(0xff9491a1);

  // lightThemePinkColor Color Swatch
  static const Color lightThemePinkColour = Color(0xfff08e98);

  // lightThemeWhiteColor Color Swatch
  static const Color lightThemeWhiteColour = Color(0xffffffff);

  // lightThemeTintStockColor Color Swatch
  static const Color lightThemeTintStockColour = Color(0xfff6f6f9);

  // lightThemeYellowColor Color Swatch
  static const Color lightThemeYellowColour = Color(0xfffec613);

  // lightThemeStockColor Color Swatch
  static const Color lightThemeStockColour = Color(0xffe4e4e9);

  // darkThemeDarkSharpColor Color Swatch
  static const Color darkThemeDarkSharpColour = Color(0xff191821);

  // darkThemeBGDark Color Swatch
  static const Color darkThemeBGDark = Color(0xff0e0d11);

  // darkThemeDarkNavBarColor Color Swatch
  static const Color darkThemeDarkNavBarColour = Color(0xff201f27);
}
```

在 `core/res/styles/text.dart` 中添加如下内容：

```dart
import 'package:flutter/widgets.dart';

abstract class TextStyles {
  /// weight: w700
  ///
  /// size: 48
  ///
  /// height: 2.4 >> 57.6px
  static const TextStyle headingBold = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700, // bold
    height: 1.2, // 57.6px
  );

  /// weight: w700
  ///
  /// size: 20
  ///
  /// height: 1.5 >> 30px
  static const TextStyle headingBold1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700, // bold
    height: 1.5, // 30px
  );

  /// weight: w400
  ///
  /// size: 20
  ///
  /// height: 1.5 >> 30px
  static const TextStyle headingRegular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 30px
  );

  /// weight: w700
  ///
  /// size: 30
  ///
  /// height: 1.5 >> 45px
  static const TextStyle headingBold3 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700, // bold
    height: 1.5, // 45px
  );

  /// weight: w600
  ///
  /// size: 22
  ///
  /// height: 1.5 >> 33px
  static const TextStyle headingSemiBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.5, // 33px
  );

  /// weight: w600
  ///
  /// size: 16
  ///
  /// height: 1.5 >> 24px
  static const TextStyle headingSemiBold1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.5, // 24px
  );

  /// weight: w500
  ///
  /// size: 28
  ///
  /// height: 1.5 >> 42px
  static const TextStyle headingMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 42px
  );

  /// weight: w500
  ///
  /// size: 24
  ///
  /// height: 1.5 >> 36px
  static const TextStyle headingMedium1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 36px
  );

  /// weight: w500
  ///
  /// size: 22
  ///
  /// height: 1.5 >> 33px
  static const TextStyle headingMedium2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 33px
  );

  /// weight: w500
  ///
  /// size: 20
  ///
  /// height: 1.5 >> 30px
  static const TextStyle headingMedium3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 30px
  );

  /// weight: w500
  ///
  /// size: 16
  ///
  /// height: 1.5 >> 24px
  static const TextStyle headingMedium4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 24px
  );

  /// weight: w600
  ///
  /// size: 20
  ///
  /// height: 1.5 >> 30px
  static const TextStyle buttonTextHeadingSemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.5, // 30px
  );

  /// weight: w400
  ///
  /// size: 12
  ///
  /// height: 1.5 >> 18px
  static const TextStyle paragraphSubTextRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 18px
  );

  /// weight: w400
  ///
  /// size: 16
  ///
  /// height: 1.5 >> 24px
  static const TextStyle paragraphSubTextRegular1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px
  );

  /// weight: w400
  ///
  /// size: 13
  ///
  /// height: 1.5 >> 19.5px
  static const TextStyle paragraphSubTextRegular2 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 19.5px
  );

  /// weight: w400
  ///
  /// size: 14
  ///
  /// height: 1.5 >> 21px
  static const TextStyle paragraphSubTextRegular3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 21px
  );

  /// weight: w400
  ///
  /// size: 14
  ///
  /// height: 1.71 >> 24px
  static const TextStyle paragraphRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.71, // 24px
  );

  static const TextStyle appLogo = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );
}

```
在 `core/utils/core_utiles.dart` 中添加如下内容：

```dart
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

```

现在可以修改 `core/res/styles/colours.dart` 文件，添加如下内容：

```dart
...
import 'package:dbestech_ecomly/core/utils/core_utils.dart'; // add this
import 'package:flutter/material.dart';

abstract class Colours {
    ...
    // ↓↓↓ add this ↓↓↓
    static Color classicAdaptiveTextColour(BuildContext context) =>
      CoreUtils.adaptiveColour(
        context,
        darkModeColour: Colours.lightThemeWhiteColour,
        lightModeColour: Colours.lightThemePrimaryTextColour,
      );
}
```

修改 `lib/main.dart` 文件 

```dart
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
```