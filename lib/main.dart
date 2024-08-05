import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:chef_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  await ScreenUtil.ensureScreenSize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<GlobalCubitCubit>()..getCachedLang(),
      ),
      BlocProvider(
        // create: (context) => sl<AuthCubit>(),
        create: (create) => AuthCubit(sl.get<AuthRepoImpl>()),
      ),
      BlocProvider(
        // create: (context) => sl<AuthCubit>(),
        create: (create) => sl<HomeCubit>(),
      ),
      BlocProvider(
        // create: (context) => sl<AuthCubit>(),
        create: (create) => sl<MenuCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}
