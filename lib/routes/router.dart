import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_example/page/a.dart';
import 'package:gorouter_example/page/b.dart';
import 'package:gorouter_example/page/c.dart';
import 'package:gorouter_example/page/home.dart';
import 'package:gorouter_example/page/main_screen.dart';
import 'package:gorouter_example/page/settings.dart';
import 'package:gorouter_example/page/splash.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: A.routeName,
      name: A.routeName,
      builder: (context, state) => const A(),
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: B.routeName,
      name: B.routeName,
      builder: (context, state) => const B(),
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: C.routeName,
      name: C.routeName,
      builder: (context, state) => const C(),
    ),
    ShellRoute(
        navigatorKey: shellRootNavigatorKey,
        pageBuilder: (context, state, child) => CustomTransitionPage(
              child: MainPage(child: child),
              transitionsBuilder:
                  (context, firstAnimation, secondAnimation, child) =>
                      FadeTransition(
                opacity: firstAnimation,
                child: child,
              ),
            ),
        routes: [
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            parentNavigatorKey: shellRootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const HomePage(),
              key: state.pageKey,
              transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) =>
                  FadeTransition(
                opacity: animation,
                key: state.pageKey,
                child: child,
              ),
              transitionDuration: const Duration(milliseconds: 300),
            ),
          ),
          GoRoute(
            parentNavigatorKey: shellRootNavigatorKey,
            path: SettingsPage.routeName,
            name: SettingsPage.routeName,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const SettingsPage(),
              key: state.pageKey,
              transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) =>
                  FadeTransition(
                opacity: animation,
                key: state.pageKey,
                child: child,
              ),
              transitionDuration: const Duration(milliseconds: 300),
            ),
          ),
        ]),
  ],
);
