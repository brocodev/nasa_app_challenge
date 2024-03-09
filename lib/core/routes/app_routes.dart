sealed class AppRoutes {
  static const splash = AppRoute._('splash', '/');
  static const onboarding = AppRoute._('onboarding', '/onboarding');
  static const home = AppRoute._('home', '/home');
  static const apod = AppRoute._('apod', 'apod');
  static const viewApod = AppRoute._('viewApod', 'viewApod');

  static const search = AppRoute._('search', '/search');
  static const mediaContent = AppRoute._('content', 'mediaContent');
}

class AppRoute {
  const AppRoute._(this.name, this.path);

  final String name;
  final String path;
}
