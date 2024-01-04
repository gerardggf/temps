import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temps/app/presentation/modules/offline/offline_view.dart';
import 'package:temps/app/presentation/modules/settings/settings_view.dart';
import 'package:temps/main.dart';

import '../modules/home/home_view.dart';
import '../splash_view.dart';
import 'routes.dart';

mixin RouterMixin on State<TempsApp> {
  final router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.splash,
        path: '/',
        builder: (_, __) => const SplashView(),
      ),
      GoRoute(
        name: Routes.home,
        path: '/home',
        builder: (_, __) => const HomeView(),
      ),
      GoRoute(
        name: Routes.offline,
        path: '/offline',
        builder: (_, __) => const OfflineView(),
      ),
      GoRoute(
        name: Routes.settings,
        path: '/settings',
        builder: (_, __) => const SettingsView(),
      ),
    ],
  );
}
