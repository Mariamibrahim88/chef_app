import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/cubit/global_cubit_state.dart';
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocBuilder<GlobalCubitCubit, GlobalCubitState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'EG'),
          ],
          locale: Locale(BlocProvider.of<GlobalCubitCubit>(context).lanCode),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'Flutter Demo',
          theme: getAppThem(),
        );
      },
    );
  }
}
