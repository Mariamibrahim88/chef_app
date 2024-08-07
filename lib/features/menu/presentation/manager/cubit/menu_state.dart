sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class ChangItemState extends MenuState {}

final class ChangeGroupValState extends MenuState {}

final class AddMealLoadingState extends MenuState {}

final class AddMealSuccessState extends MenuState {}

final class AddMealFailureState extends MenuState {
  final String message;

  AddMealFailureState(this.message);
}

final class DeleteMealLoadingState extends MenuState {}

final class DeleteMealSuccessState extends MenuState {}

final class DeleteMealFailureState extends MenuState {
  final String message;

  DeleteMealFailureState(this.message);
}

final class GetMealLoadingState extends MenuState {}

final class GetMealSuccessState extends MenuState {}

final class GetMealFailureState extends MenuState {
  final String message;

  GetMealFailureState(this.message);
}

class UploadImage extends MenuState {}


//addMeal
