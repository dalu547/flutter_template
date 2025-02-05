import 'dart:async';

import 'package:flutter/material.dart';
import 'package:template/core/di/app_di.dart';
import 'package:template/core/storage/preference_keys.dart';
import 'package:template/core/storage/preference_manager.dart';

import '../../../../app/resources/assets_manager.dart';
import '../../../../core/router/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final preferences = instance<Preferences>();

  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    bool isLoggedIn = preferences.getBool(PreferencesKeys.isLoggedIn);
    if (isLoggedIn) {
      // navigate to main screen
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    } else {
      // navigate to login screen
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.digitele_icon),
        ),
      ),
    );
  }
}
