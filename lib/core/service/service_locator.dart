import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => GlobalCubitCubit());
}
