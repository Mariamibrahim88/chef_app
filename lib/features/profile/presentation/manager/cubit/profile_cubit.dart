import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:chef_app/features/profile/data/models/chef_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profiRepo) : super(ProfileInitial());
  final profileRepo profiRepo;

  XFile? imgPic;
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  //chefModel? chef;

  final TextEditingController? chefNameController = TextEditingController();
  final TextEditingController? chefPhoneController = TextEditingController();
  final TextEditingController? chefLocationController = TextEditingController();

  final TextEditingController? chefDescController = TextEditingController();
  final TextEditingController? chefChargeController = TextEditingController();
  final TextEditingController? chefBrandController = TextEditingController();

  chefModel? chef;

  void updateProfile({
    String? name,
    String? phone,
    String? brandName,
    String? minCharge,
    XFile? profilePic,
    var location,
    String? disc,
  }) async {
    emit(ProfileUpdateLoading());
    final response = await profiRepo.updateProfile(
      name: chefNameController!.text.isNotEmpty
          ? chefNameController!.text
          : chef?.name,
      phone: chefPhoneController!.text.isNotEmpty
          ? chefPhoneController!.text
          : chef?.phone ?? '01234567891',
      brandName: chefBrandController!.text.isNotEmpty
          ? chefBrandController!.text
          : chef?.brandName ?? 'mariam',
      minCharge: chefChargeController!.text.isNotEmpty
          ? chefChargeController!.text
          : chef?.minCharge.toString() ?? 150.toString(),
      profilePic: imgPic != null ? imgPic! : XFile(chef!.profilePic),
      location:
          '{"name":"Egypt","address":"quantra","coordinates":[12345678,87654321]}',
      disc: chefDescController!.text.isNotEmpty
          ? chefDescController!.text
          : chef?.disc ?? "very good chef in the world",
    );
    response.fold(
      (Failure) => emit(ProfileUpdateFailure(Failure.message)),
      (r) => emit(ProfileUpdateSuccess()),
    );
  }

  void uploadProfilePic(XFile val) {
    imgPic = val;
    emit(UploadProfilePic());
  }

  void getChefData() async {
    emit(GetChafLoading());

    final response = await profiRepo.getChafData();
    response.fold(
      (Failure) => emit(GetChafFailure(Failure.message)),
      (chefModel) => emit(GetChafSuccess(chefModel)),
    );
  }

  void logout() async {
    emit(LogOutLoading());
    final result = await profiRepo.logout();
    result.fold((Failure) => emit(LogOutFailure(Failure.message)), (r) async {
      await sl<CacheHelper>().removeData(key: ApiKeys.token);
      emit(LogOutSuccess());
    });
  }
}
