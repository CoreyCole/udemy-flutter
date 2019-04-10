class ValidationMixin {
  String validateEmail(String email) {
    RegExp exp = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var valid = exp.hasMatch(email);
    if (!valid) {
      return 'Invalid email address!';
    }
    return null;
  }

  String validatePassword(String password) {
    var valid = password.length >= 6;
    if (!valid) {
      return 'Password must be at least 6 characters long!';
    }
    return null;
  }
}