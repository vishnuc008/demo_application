import 'package:demo_application/Demo_App/core/connection_checker.dart';
import 'package:demo_application/Demo_App/domain/repositories/app_repository_impl.dart';
import 'package:demo_application/Demo_App/domain/usecases/product_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'Demo_App/core/api_provider.dart';
import 'Demo_App/core/hive_service.dart';
import 'Demo_App/data/remote/data_source/app_datasource.dart';
import 'Demo_App/data/repository/app_repository.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  getIt.registerLazySingleton<ApiProvider>(() => ApiProvider());
  getIt.registerLazySingleton<HiveService>(() => HiveService());
  getIt.registerLazySingleton<AppDataSourCe>(() => AppDataSourceImpl(getIt()));
  getIt.registerLazySingleton<AppRepoSitory>(() => AppRepositoryImPl(getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  getIt.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(getIt()));
  getIt.registerLazySingleton<ProductsUseCase>(() => ProductsUseCase(getIt()));
}
