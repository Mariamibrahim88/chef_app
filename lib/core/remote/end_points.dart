class EndPoint {
  static const String baseurl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String chefsignIn = 'chef/signin';
  static const String sendCode = 'chef/send-code';
  static const String resetPassword = 'chef/change-forgotten-password';
  static const String changePassword = 'chef/change-password';
  static const String getChef = 'chef/get-chef/';
  static const String updteChef = 'chef/update';
  static const String signUp = 'chef/signup';
  static const String addMeal = 'meal/add-to-menu';
  static const String logout = 'chef/logout';
  static String getchefdata(id) {
    return '$getChef$id';
  }

  static String getchefmeal(id) {
    return 'chef/get-chef/$id/meals';
  }

  static String deletemeal(id) {
    return 'meal/delete-meal/$id';
  }
}

class ApiKeys {
  static const String message = 'message';
  static const String token = 'token';
  static const String confirmPassword = 'confirmPassword';
  static const String code = 'code';
  static const String email = 'email';
  static const String password = 'password';
}
