import 'package:dio/dio.dart';
import 'package:template/modules/authentication/presentation/viewmodel/login_viewmodel.dart';

import '../../../core/database/app_database.dart';
import '../../../core/di/app_di.dart';
import '../../user/presentation/viewmodels/profile_viewmodel.dart';
import '../data/datasources/local/authentication_local_datasource.dart';
import '../data/datasources/local/user_details_dao.dart';
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

  //Register UserDetailsDao (from AppDatabase)
  instance.registerLazySingleton<UserDetailsDao>(
      () => instance<AppDatabase>().userDetailsDao);

  //Register Authentication Local Data Source with injected DAO
  instance.registerLazySingleton<AuthenticationLocalDatasource>(
      () => LocalDataSourceImpl(instance<UserDetailsDao>()));

  // Register Authentication Repository
  instance.registerLazySingleton<AuthenticationRepository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  // Register LoginUseCase Use Case
  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));

  // Register Login ViewModel/BLoC
  instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(instance<LoginUseCase>()));

  // Register Profile ViewModel/Cubit
  instance.registerFactory<ProfileViewModel>(
      () => ProfileViewModel(instance<AuthenticationRepository>()));
}
