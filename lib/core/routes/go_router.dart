import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/routes/app_routes.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/onboarding_page.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/splash_page.dart';

final goRouterConfig = GoRouter(
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      builder: (__, _) => const SplashPage(),
    ),
    GoRoute(
      name: AppRoutes.onboarding.name,
      path: AppRoutes.onboarding.path,
      pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (
            __,
            animation,
            _,
            child,
          ) =>
              buildTransition(
            transition: RouteTransition.fade,
            animation: animation,
            child: child,
          ),
          child: const OnboardingPage(),
        ),
    ),
  ],
);
