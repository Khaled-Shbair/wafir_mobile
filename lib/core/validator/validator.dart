class Validator {
  static String? emailValidator(String? email) {}

  static String? nameValidate(String? name) {
    if (name!.isEmpty) {
      return 'Invalid Name';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      return 'Name must contain only letters.';
    }
    return null;
  }

  static String? phoneValidate(String? phone) {
    if (phone!.isEmpty) {
      return 'Invalid Phone Number';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      return 'Phone number must be 10 digits long.';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Invalid Password';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
      return 'Password must contain at least one special character.';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
      return 'Password must contain at least one digit.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }
}
