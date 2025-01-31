import 'package:dio/dio.dart';
import 'package:template/modules/authentication/presentation/viewmodel/login_viewmodel.dart';

import '../../../core/di/app_di.dart';
import '../data/datasources/local/authentication_local_datasource.dart';
import '../data/datasources/remote/authentication_remote_datasource.dart';
import '../data/datasources/remote/authentication_service_client.dart';
import '../data/repositories/authentication_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/usecases/login_usecase.dart';

Future<void> initAuthenticationModule() async {
  // Ensure Dio is already registered in App Module
  final dio = instance<Dio>();

  // Register Authentication Service Client
  instance.registerLazySingleton<AuthenticationServiceClient>(
      () => AuthenticationServiceClient(dio));

  // Register Authentication Remote Data Source
  instance.registerLazySingleton<AuthenticationRemoteDatasource>(
      () => RemoteDataSourceImpl(instance()));

  // Register Authentication Local Data Source
  instance.registerLazySingleton<AuthenticationLocalDatasource>(
      () => LocalDataSourceImpl());

  // Register Authentication Repository
  instance.registerLazySingleton<AuthenticationRepository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  // Register LoginUseCase Use Case
  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));

  // Register Login ViewModel/BLoC
  instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(instance<LoginUseCase>()));
}
