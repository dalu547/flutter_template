import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:template/modules/onboard/presentation/views/splash_screen.dart';

import '../../modules/authentication/presentation/view/login_screen.dart';
import '../../app/resources/strings_manager.dart';
import '../../modules/home/presentation/views/main_home_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/mainHome";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        // initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());

      // case Routes.onBoardingRoute:
      //   return MaterialPageRoute(builder: (_) => OnBoardingView());
      // case Routes.registerRoute:
      //   // initRegisterModule();
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      // case Routes.forgotPasswordRoute:
      //   // initForgotPasswordModule();
      //   return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        //   // initHomeModule();
        return MaterialPageRoute(builder: (_) => MainHomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
