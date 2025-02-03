import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:template/app/resources/central_theme_manager.dart';
import 'package:template/core/router/routes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<ThemeManager>(
          builder: (context, themeManager, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeManager.themeData,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splashRoute,
            );
          },
        );
      },
    );
  }
}
