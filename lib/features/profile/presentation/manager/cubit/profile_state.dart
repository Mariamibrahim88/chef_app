part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileUpdateLoading extends ProfileState {}

final class ProfileUpdateSuccess extends ProfileState {}

final class ProfileUpdateFailure extends ProfileState {
  ProfileUpdateFailure(this.message);
  final String message;
}

final class GetChafLoading extends ProfileState {}

final class GetChafSuccess extends ProfileState {
  final chefModel chef;
  GetChafSuccess(this.chef);
}

final class GetChafFailure extends ProfileState {
  GetChafFailure(this.message);
  final String message;
}

final class UploadProfilePic extends ProfileState {}

final class LogOutLoading extends ProfileState {}

final class LogOutSuccess extends ProfileState {}

final class LogOutFailure extends ProfileState {
  LogOutFailure(this.message);
  final String message;
}
