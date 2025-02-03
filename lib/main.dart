import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/app/app.dart';
import 'package:template/app/resources/central_theme_manager.dart';
import 'package:template/core/di/app_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: MyApp(),
    ),
  );
}
