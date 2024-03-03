import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/home/presentation/pages/home_page.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/onboarding_page.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/splash_page.dart';

final goRouterConfig = GoRouter(
  initialLocation: kDebugMode ? AppRoutes.home.path : AppRoutes.splash.path,
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      builder: (__, _) => const SplashPage(),
    ),
    GoRoute(
      name: AppRoutes.onboarding.name,
      path: AppRoutes.onboarding.path,
      pageBuilder: (_, state) => buildTransitionPage(
        transition: RouteTransition.fade,
        child: const OnboardingPage(),
      ),
    ),
    GoRoute(
      name: AppRoutes.home.name,
      path: AppRoutes.home.path,
      pageBuilder: (_, state) => buildTransitionPage(
        transition: RouteTransition.fade,
        child: const HomePage(),
      ),
    ),
  ],
);
