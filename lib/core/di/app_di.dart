import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:template/core/storage/secure_storage.dart';
import 'package:template/modules/authentication/di/authentication_di.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/network/network_info.dart';
import '../database/app_database.dart';
import '../storage/preference_manager.dart';

final GetIt instance = GetIt.instance; // Creating a GetIt instance

Future<void> initAppModule() async {
  //Register shared preferences
  instance.registerSingleton<Preferences>(Preferences());
  await instance<Preferences>().init();

  instance.registerSingleton<SecureStorage>(SecureStorage());
  await instance<SecureStorage>().init();

  // Register Network Info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker.createInstance()));

  // Register DioClient
  instance.registerLazySingleton<DioClient>(() => DioClient());

  // Initialize Dio asynchronously and store it
  final dioClient = instance<DioClient>();
  final dio = await dioClient.getDio();

  // Register Dio after fetching it
  instance.registerLazySingleton<Dio>(() => dio);

  //Initialize Floor Database at App Level
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  instance.registerLazySingleton<AppDatabase>(() => database);

  initFeaturesDependecies();
}

Future<void> initFeaturesDependecies() async {
  instance.pushNewScope();
  await initAuthenticationModule();
}
