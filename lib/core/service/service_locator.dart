import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/remote/api_consumer.dart';
import 'package:chef_app/core/remote/api_interceptors.dart';
import 'package:chef_app/core/remote/api_service.dart';
import 'package:chef_app/core/remote/dio_consumer.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => AuthCubit(sl()));
  sl.registerSingleton<ApiService>(ApiService(Dio()));
  //sl.registerSingleton(() => AuthRepoImpl());
  //sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerSingleton<AuthRepoImpl>(AuthRepoImpl(sl.get<ApiService>()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ApiInterceptors());
  sl.registerLazySingleton(() => GlobalCubitCubit());
}
