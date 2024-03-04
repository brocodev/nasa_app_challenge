sealed class AppRoutes {
  static const splash = AppRoute._('splash', '/');
  static const onboarding = AppRoute._('onboarding', '/onboarding');
  static const home = AppRoute._('home', '/home');
  static const apod = AppRoute._('apod', 'apod');
}

class AppRoute {
  const AppRoute._(this.name, this.path);

  final String name;
  final String path;
}
