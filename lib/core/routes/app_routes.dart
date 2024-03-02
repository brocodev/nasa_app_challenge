sealed class AppRoutes {
  static const splash = AppRoute._('splash', '/');
  static const onboarding = AppRoute._('onboarding', '/onboarding');
}

class AppRoute {
  const AppRoute._(this.name, this.path);

  final String name;
  final String path;
}
