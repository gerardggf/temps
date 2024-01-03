import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    ],
  );
}
