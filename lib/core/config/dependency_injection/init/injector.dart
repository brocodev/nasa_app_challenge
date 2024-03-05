import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/config/dependency_injection/init/injector.config.dart';

@InjectableInit(preferRelativeImports: false)
Future<void> configure(Environment env) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  GetIt.instance.init(environment: env.name);
}
