import 'package:chef_app/core/cubit/global_cubit_state.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalCubitCubit extends Cubit<GlobalCubitState> {
  GlobalCubitCubit() : super(GlobalCubitInitial());
  // bool isArabic = false;
  String lanCode = 'ar';

  void changeLang(String codeLan) async {
    emit(GlobalCubitLoading());
    //isArabic = !isArabic;
    lanCode = codeLan;
    await sl<CacheHelper>().cacheLanguage(codeLan);

    emit(GlobalCubitSuccess());
  }

  void getCachedLang() {
    emit(GlobalCubitLoading());
    final cachedlan = sl<CacheHelper>().getCachedLanguage();
    lanCode = cachedlan;
    emit(GlobalCubitSuccess());
  }
}
