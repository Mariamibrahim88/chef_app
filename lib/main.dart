import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  await ScreenUtil.ensureScreenSize();
  runApp(BlocProvider(
    create: (context) => sl<GlobalCubitCubit>()..getCachedLang(),
    child: const MyApp(),
  ));
}
