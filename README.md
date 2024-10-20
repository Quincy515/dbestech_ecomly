# dbestech_ecomly

- [dbestech\_ecomly](#dbestech_ecomly)
    - [1.Theming the app](#1theming-the-app)
    - [2.Caching frontend](#2caching-frontend)
    - [3.App routing](#3app-routing)
    - [4.App onboarding screen](#4app-onboarding-screen)
    - [5.App domain layer](#5app-domain-layer)


### 1.Theming the app
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

### 2.Caching frontend

在 `lib/core/common/` 目录下创建 `singletons/cache.dart` 文件，添加如下内容：

```dart
import 'package:flutter/material.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  String? _sessionToke;
  String? _userId;
  final themeModeNotifier = ValueNotifier(ThemeMode.system);

  String? get sessionToken => _sessionToke;
  String? get userId => _userId;

  void setSessionToken(String? newToken) {
    if (_sessionToke != newToken) _sessionToke = newToken;
  }

  void setUserId(String? newUserId) {
    if (_userId != newUserId) _userId = newUserId;
  }

  void setThemeMode(ThemeMode newThemeMode) {
    if (themeModeNotifier.value != newThemeMode) {
      themeModeNotifier.value = newThemeMode;
    }
  }

  void resetSession() {
    setSessionToken(null);
    setUserId(null);
  }
}

```

新建文件 `lib/core/common/app/cache_helper.dart`，添加如下内容：

```dart
import 'package:dbestech_ecomly/core/common/singletons/cache.dart';
import 'package:dbestech_ecomly/core/extensions/string_extension.dart';
import 'package:dbestech_ecomly/core/extensions/theme_mode_extension.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;
  static const _sesssionTokenKey = 'user-session-token';
  static const _userIdKey = 'user-id';
  static const _themeModeKey = 'theme-mode';
  static const _firstTimerKey = 'is-user-first-timer';

  Future<bool> cacheSessionToken(String token) async {
    try {
      final result = await _prefs.setString(_sesssionTokenKey, token);
      Cache.instance.setSessionToken(token);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUserId(String userId) async {
    try {
      final result = await _prefs.setString(_userIdKey, userId);
      Cache.instance.setUserId(userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> cacheThemeMode(ThemeMode themeMode) async {
    await _prefs.setString(_themeModeKey, themeMode.stringValue);
    Cache.instance.setThemeMode(themeMode);
  }

  Future<void> cacheFirstTimer() async {
    await _prefs.setBool(_firstTimerKey, false);
  }

  String? getSessionToken() {
    final sessionToken = _prefs.getString(_sesssionTokenKey);
    if (sessionToken case String()) {
      Cache.instance.setSessionToken(sessionToken);
    }
    return sessionToken;
  }

  String? getUserId() {
    final userId = _prefs.getString(_userIdKey);
    if (userId case String()) {
      Cache.instance.setUserId(userId);
    }
    return userId;
  }

  ThemeMode getThemeMode() {
    final themeModeStringValue = _prefs.getString(_themeModeKey);
    final themeMode = themeModeStringValue?.toThemeMode ?? ThemeMode.system;
    Cache.instance.setThemeMode(themeMode);
    return themeMode;
  }

  Future<void> resetSession() async {
    await _prefs.remove(_sesssionTokenKey);
    await _prefs.remove(_userIdKey);
    Cache.instance.resetSession();
  }

  bool isFirstTime() => _prefs.getBool(_firstTimerKey) ?? true;
}
```

新增文件 `lib/core/extensions/string_extension.dart`，添加如下内容：

```dart
import 'package:flutter/material.dart';

extension StringExt on String {
  ThemeMode get toThemeMode {
    return switch (toLowerCase()) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
```

新增文件 `lib/core/extensions/theme_mode_extension.dart`，添加如下内容：

```dart
import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  String get stringValue {
    return switch (this) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      _ => 'system',
    };
  }
}
```

新增文件 `lib/core/extensions/context_extension.dart` ，添加如下内容：

```dart
import 'package:dbestech_ecomly/core/common/singletons/cache.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);

  double get height => size.height;
  double get width => size.width;

  bool get isDarkMode {
    return switch (Cache.instance.themeModeNotifier.value) {
      ThemeMode.system =>
        MediaQuery.platformBrightnessOf(this) == Brightness.dark,
      ThemeMode.dark => true,
      _ => false,
    };
  }

  bool get isLightMode => !isDarkMode;
}
```

修改 `lib/core/utils/core_utils.dart` 文件，如下内容：

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

修改为

```dart
import 'package:dbestech_ecomly/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

abstract class CoreUtils {
  const CoreUtils();

  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    // return MediaQuery.platformBrightnessOf(context) == Brightness.light
    //     ? lightModeColour
    //     : darkModeColour;
    return context.isDarkMode ? darkModeColour : lightModeColour;
  }
}
```

### 3.App routing

安装 `go_router`

```shell
flutter pub add go_router
```

新建文件 `lib/core/services/router.dart` 

```dart
part 'router.main.dart';
```

和 `lib/core/services/router.main.dart` 文件，添加如下内容：

```dart
part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [],
);
```

在 `lib/main.dart` 中进行配置路由

```dart
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
```
修改为
```dart
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
```

新增页面文件

```shell 
mkdir lib/src/on_boarding/presentaion/views/on_boarding_screen.dart
```

在 `lib/src/on_boarding/presentaion/views/on_boarding_screen.dart` 文件中添加如下内容：

```dart
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            allowImplicitScrolling: true,
            controller: pageController,
            children: const [],
          )),
    ));
  }
}
```

新增共用的组件 `lib/core/common/widgets/app_bar_bottom.dart`

```dart
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/utils/core_utils.dart';
import 'package:flutter/material.dart';

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ColoredBox(
        color: CoreUtils.adaptiveColour(
          context,
          lightModeColour: Colors.white,
          darkModeColour: Colours.darkThemeDarkSharpColour,
        ),
        child: const SizedBox(height: 1, width: double.maxFinite),
      ),
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
```

新增页面 `lib/src/auth/presentation/views/splash_screen.dart`

```dart
import 'package:dbestech_ecomly/core/common/widgets/ecomly.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colours.lightThemePrimaryColour,
      body: EcomlyLogo(),
    );
  }
}
```

在 `lib/core/common/widgets/ecomly.dart` 中新增 `EcomlyLogo` 组件

```dart
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class EcomlyLogo extends StatelessWidget {
  const EcomlyLogo({super.key, this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Ecom',
        style: style ?? TextStyles.appLogo.white,
        children: const [
          TextSpan(
            text: 'ly',
            style: TextStyle(color: Colours.lightThemeSecondaryColour),
          ),
        ],
      ),
    );
  }
}
```

扩展 `text` 新增文件 `lib/core/extensions/text_extension.dart`

```dart
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle get orange => copyWith(color: Colours.lightThemeSecondaryColour);

  TextStyle get dark => copyWith(color: Colours.lightThemePrimaryTextColour);

  TextStyle get grey => copyWith(color: Colours.lightThemeSecondaryTextColour);

  TextStyle get white => copyWith(color: Colours.lightThemeWhiteColour);

  TextStyle get primary => copyWith(color: Colours.lightThemePrimaryColour);

  TextStyle adaptiveColour(BuildContext context) =>
      copyWith(color: Colours.classicAdaptiveTextColour(context));
}
```

修改 `lib/core/services/router.main.dart` 可以查看 `splash` 页面效果

```dart
part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ],
);
```

新增页面文件 `lib/src/auth/presentation/views/login_screen.dart`

```dart
import 'package:dbestech_ecomly/core/common/widgets/app_bar_bottom.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyles.headingSemiBold,
        ),
        bottom: const AppBarBottom(),
      ),
      body: const Placeholder(),
    );
  }
}
```

创建 `lib/src/dashboard/presentation/views/dashboard_screen.dart` 文件

```dart
import 'package:dbestech_ecomly/src/dashboard/presentation/utils/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: DashboardUtils.scaffoldKey,
      body: child,
    );
  }
}

```

和文件 `lib/src/dashboard/presentation/utils/dashboard_utils.dart`

```dart
import 'package:flutter/material.dart';

abstract class DashboardUtils {
  const DashboardUtils();

  static final scaffoldKey = GlobalKey<ScaffoldState>();
}
```

新增 `dashboard` 路由

```dart
part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) async {
      },
    ),
  ],
);
```

这里使用 `async` 报错 

```shell
The argument type 'Future<Null> Function(BuildContext, GoRouterState)' can't be assigned to the parameter type 'Widget Function(BuildContext, GoRouterState)?'. dartargument_type_not_assignable
```

使用 `get_it` 依赖注入解决

```shell
flutter pub add get_it
```

新增文件 `lib/core/services/injection_container.dart`

```dart
part 'injection_container.main.dart';
```

和文件 `lib/core/services/injection_container.main.dart`

```dart
part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton(() => prefs);
}

```

修改 `lib/mian.dart` 文件

```dart
...
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}
...
```

新增 `lib/src/home/presentation/views/home_view.dart` 文件

```dart
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const path = '/home';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

完成路由 `lib/core/services/router.main.dart` 文件修改

```dart
part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        final cacheHelper = sl<CacheHelper>()
          ..getSessionToken()
          ..getUserId();

        if ((Cache.instance.sessionToken == null ||
                Cache.instance.userId == null) &&
            !cacheHelper.isFirstTime()) {
          return LoginView.path;
        }
        if (state.extra == 'home') return HomeView.path;

        return null;
      },
      builder: (context, state) {
        final cacheHelper = sl<CacheHelper>()
          ..getSessionToken()
          ..getUserId();

        if (cacheHelper.isFirstTime()) {
          return const OnBoardingView();
        }
        return const SplashView();
      },
    ),
    GoRoute(
        path: LoginView.path, builder: (context, state) => const LoginView()),
    ShellRoute(
      builder: (context, state, child) =>
          DashboardView(state: state, child: child),
      routes: [
        GoRoute(
            path: HomeView.path, builder: (context, state) => const HomeView()),
      ],
    ),
  ],
);
```

### 4.App onboarding screen

修改 `lib\src\on_boarding\presentaion\views\on_boarding_view.dart` 文件

```dart
import 'package:dbestech_ecomly/src/on_boarding/presentaion/on_boarding_info_section.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            allowImplicitScrolling: true,
            controller: pageController,
            children: const [
              OnBoardingInfoSection.second(),
              OnBoardingInfoSection.first(),
            ],
          )),
    ));
  }
}
```

新增文件 `lib\src\on_boarding\presentaion\on_boarding_info_section.dart` 文件

```dart
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/media.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : first = true;
  const OnBoardingInfoSection.second({super.key}) : first = false;

  final bool first;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(first ? Media.onBoardingFemale : Media.onBoardingMale),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            switch (first) {
              true => Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: '${DateTime.now().year}\n',
                    style: TextStyles.headingBold.orange,
                    children: [
                      TextSpan(
                        text: 'Winter Sale is live now.',
                        style: TextStyle(
                          color: Colours.classicAdaptiveTextColour(context),
                        ),
                      ),
                    ],
                  ),
                ),
              _ => Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: 'Flash Sale\n',
                    style: TextStyles.headingBold.adaptiveColour(context),
                    children: [
                      const TextSpan(
                        text: "Men's ",
                        style: TextStyle(
                          color: Colours.lightThemeSecondaryTextColour,
                        ),
                      ),
                      TextSpan(
                        text: 'Shirts & Watches',
                        style: TextStyle(
                          color: Colours.classicAdaptiveTextColour(context),
                        ),
                      )
                    ],
                  ),
                ),
            }
          ],
        ),
      ],
    );
  }
}
```

### 5.App domain layer
新增目录结构如下

```shell
mkdir lib/core/common/entities lib/src/auth/domain lib/src/auth/domain/entities lib/src/auth/domain/repositories lib/src/auth/domain/usercases
```
├───lib
│   ├───core
│   │   ├───common
│   │   │   ├───app
│   │   │   ├───entities
.....
│   └───src
│       ├───auth
│       │   ├───domain
│       │   │   ├───entities
│       │   │   ├───repositories
│       │   │   └───usercases
│       │   └───presentation
│       │       └───views
```

新增第三方库

```shell
flutter pub add equatable && flutter pub get
```

在文件 `lib\core\common\entities\user.dart` 中使用

```dart
import 'package:dbestech_ecomly/core/common/entities/address.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.wishlist,
    this.address,
    this.phone,
  });

  const User.empty()
      : id = '',
        name = '',
        email = '',
        isAdmin = false,
        wishlist = const [],
        address = null,
        phone = null;

  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<WishlistProduct> wishlist;
  final Address? address;
  final String? phone;

  @override
  List<Object?> get props => [id, name, email, isAdmin, wishlist.length];
}

class WishlistProduct {}
```

新增文件 `lib\core\common\entities\address.dart`

```dart
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    this.street,
    this.apartment,
    this.city,
    this.postalCode,
    this.country,
  });

  const Address.empty()
      : street = '',
        apartment = '',
        city = '',
        postalCode = '',
        country = '';

  final String? street;
  final String? apartment;
  final String? city;
  final String? postalCode;
  final String? country;

  bool get isEmpty =>
      street == null && city == null && postalCode == null && country == null;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [street, city, postalCode, country];
}
```

新增文件 `lib\src\auth\domain\repositories\auth_repository.dart`

```dart
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  ResultFuture<User> login({
    required String email,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> verifyOTP({
    required String email,
    required String otp,
  });

  ResultFuture<void> resetPassword({
    required String email,
    required String newPassword,
  });

  ResultFuture<bool> verifyToken();
}
```

这里用到了 `Either<Failure, dynamic>` 所以需要使用第三方库 `dartz` 并且自己封装 `Failure` 和 `Exception`

```shell
flutter pub add dartz && flutter pub get
```

封装 `Either<Failure, dynamic>` 新增文件 `lib\core\utils\typedefs.dart`

```dart
import 'package:dartz/dartz.dart';
import 'package:dbestech_ecomly/core/errors/failures.dart';

typedef DataMap = Map<String, dynamic>;

typedef ResultFuture<T> = Future<Either<Failure, T>>;
```

新增文件 `lib\core\errors\failures.dart` 

```dart
import 'package:dbestech_ecomly/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException e)
      : this(message: e.message, statusCode: e.statusCode);
}

class CacheFailure extends Failure {
  // 3 - Data not found in cache
  const CacheFailure({required super.message}) : super(statusCode: 3);

  CacheFailure.fromException(CacheException e) : this(message: e.message);
}
```

新增文件 `lib\core\errors\exceptions.dart`

```dart
import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
```

新增用户授权相关的 `usecase`，新增文件 `lib\src\auth\domain\usercases\forgot_password.dart`

```dart
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepository _repo;

  // ResultFuture<void> forgotPassword(String email) =>
  //     _repo.forgotPassword(email);

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
```

这里使用 `call` 方法是为了方便使用，比如

```dart
main() {
  final fpUsecase = ForgotPassword();
  // fpUsecase().forgotPassword('email');
  // 简化成 ↓↓↓
  fpUsecase('email');

}
```

但是为了 `call` 的安全性，所以使用 `UsecaseWithParams` 和 `UsecaseWithoutParams` 进行封装 `lib\core\usecase\usecase.dart`

```dart
import 'package:dbestech_ecomly/core/utils/typedefs.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}
```

比如再添加一个 `usecase` 文件 `lib\src\auth\domain\usercases\login.dart`

```dart
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Login extends UsecaseWithParams<User, LoginParams> {
  const Login(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<User> call(LoginParams params) => _repo.login(
        email: params.email,
        password: params.password,
      );
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  const LoginParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
```

完成剩余的 `lib\src\auth\domain\usercases\register.dart`

```dart
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Register extends UsecaseWithParams<void, RegisterParams> {
  const Register(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
        email: params.email,
        password: params.password,
        name: params.name,
        phone: params.phone,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  const RegisterParams.empty()
      : email = '',
        password = '',
        name = '',
        phone = '';

  final String email;
  final String password;
  final String name;
  final String phone;

  @override
  List<Object?> get props => [email, password, name, phone];
}
```

`lib\src\auth\domain\usercases\reset_password.dart`

```dart
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class ResetPassword extends UsecaseWithParams<void, ResetPasswordParams> {
  const ResetPassword(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(ResetPasswordParams params) => _repo.resetPassword(
        email: params.email,
        newPassword: params.newPassword,
      );
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams({
    required this.email,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [email, newPassword];
}
```

`lib\src\auth\domain\usercases\verify_token.dart`

```dart
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';

class VerifyToken extends UsecaseWithoutParams<bool>{
  const VerifyToken(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<bool> call() => _repo.verifyToken();
}
```

`lib\src\auth\domain\usercases\verify_otp.dart`

```dart
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class VerifyOTP extends UsecaseWithParams<void, VerifyOTPParams> {
  const VerifyOTP(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(params) =>
      _repo.verifyOTP(email: params.email, otp: params.otp);
}

class VerifyOTPParams extends Equatable {
  const VerifyOTPParams({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  List<Object?> get props => [email, otp];
}
```