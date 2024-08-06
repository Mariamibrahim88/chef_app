class menuModel {
  final String message;

  menuModel({required this.message});

  factory menuModel.fromJson(Map<String, dynamic> json) {
    return menuModel(
      message: json['message'],
    );
  }
}
