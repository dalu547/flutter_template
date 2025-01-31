import 'package:flutter/material.dart';
import 'package:template/app/app.dart';
import 'package:template/core/di/app_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
