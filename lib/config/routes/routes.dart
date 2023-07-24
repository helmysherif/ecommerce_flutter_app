import 'package:ecommerce_app/features/home/presentation/pages/home.dart';
import 'package:ecommerce_app/features/login/data/data_sources/data_sources.dart';
import 'package:ecommerce_app/features/login/domain/entities/login_entity.dart';
import 'package:ecommerce_app/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce_app/features/login/presentation/pages/login.dart';
import 'package:ecommerce_app/features/sign_up/presentation/pages/sign_up.dart';
import 'package:ecommerce_app/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/components.dart';

class Routes {
  static const String splash = "/";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "home";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(RemoteDTO()),
                  child: LoginScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.home:
        LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(builder: (context) => HomeScreen(loginEntity));
      default:
        return MaterialPageRoute(builder: (context) => undefinedRoute());
    }
  }
}
