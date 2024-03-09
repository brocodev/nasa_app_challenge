import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart';
import 'package:nasa_app_challenge/features/apod/presentation/pages/apods_page.dart';
import 'package:nasa_app_challenge/features/apod/presentation/pages/viewer_apod_page.dart';
import 'package:nasa_app_challenge/features/home/presentation/pages/home_page.dart';
import 'package:nasa_app_challenge/features/searches/presentation/pages/media_content_detail.dart';
import 'package:nasa_app_challenge/features/searches/presentation/pages/search_contents_page.dart';
import 'package:nasa_app_challenge/features/searches/presentation/pages/viewer_content_page.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/onboarding_page.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/pages/splash_page.dart';

final apodsBloc = GetIt.I.get<APODsBloc>();

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
      pageBuilder: (_, __) => buildTransitionPage(
        transition: RouteTransition.fade,
        child: BlocProvider(
          create: (_) => apodsBloc..add(const APODsEvent.fetchAPODs()),
          child: const HomePage(),
        ),
      ),
      routes: [
        GoRoute(
          name: AppRoutes.apod.name,
          path: AppRoutes.apod.path,
          builder: (__, state) => BlocProvider.value(
            value: apodsBloc,
            child: APODsPage(index: state.extra! as int),
          ),
          routes: [
            GoRoute(
              name: AppRoutes.viewApod.name,
              path: AppRoutes.viewApod.path,
              builder: (__, state) => ViewerAPODPage(
                apod: state.extra! as APODFile,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.search.name,
      path: AppRoutes.search.path,
      builder: (__, _) => const SearchContentsPage(),
      routes: [
        GoRoute(
          name: AppRoutes.mediaContent.name,
          path: AppRoutes.mediaContent.path,
          builder: (__, state) => MediaContentPage(
            content: state.extra! as MediaContent,
          ),
        ),
        GoRoute(
          name: AppRoutes.mediaContentViewer.name,
          path: AppRoutes.mediaContentViewer.path,
          builder: (__, state) => ViewerContentPage(
            content: state.extra! as MediaContent,
          ),
        ),
      ],
    ),
  ],
);
