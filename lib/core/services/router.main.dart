part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
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
    GoRoute(
        path: RegisterView.path,
        builder: (context, state) => const RegisterView()),
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
