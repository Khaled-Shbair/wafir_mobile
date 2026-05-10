import 'package:wafir_mobile/core/resource/manager_strings.dart';

class Validator {
  static String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return ManagerStrings.pleaseEnterYourEmailAddress;
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+').hasMatch(email.trim())) {
      return ManagerStrings.pleaseEnterYourEmailAddressCorrectly;
    }
    return null;
  }

  static String? searchValidate(String? keyWord) {
    if (keyWord!.isEmpty) {
      return 'Invalid Name';
    }
    if (keyWord.length < 3) {
      return 'Name must contain only letters.';
    }
    return null;
  }

  static String? nameValidate(String? name) {
    if (name == null || name.isEmpty || name.length < 3 || name == '') {
      return ManagerStrings.pleaseEnterYourName;
    }
    return null;
  }

  static String? phoneValidate(String? phone) {
    if (phone == null || phone.isEmpty) {
      return ManagerStrings.pleaseEnterYourPhoneNumber;
    }
    if (!RegExp(r'^\d{8}$').hasMatch(phone)) {
      return ManagerStrings.phoneNumberMustBeEightDigitsLong;
    }
    return null;
  }

  static String? passwordValidator(String? password,
      {String? confirmPassword}) {
    if (password == null || password.isEmpty) {
      return ManagerStrings.pleaseEnterYourPassword;
    }
    if (password.length < 8) {
      return ManagerStrings.pleaseEnterYourPasswordCorrectly;
    }
    if (confirmPassword != null) {
      if (confirmPassword.isEmpty) {
        return ManagerStrings.pleaseEnterYourPassword;
      }

      if (confirmPassword.length < 8) {
        return ManagerStrings.pleaseEnterYourPasswordCorrectly;
      }

      if (password != confirmPassword) {
        return ManagerStrings.passwordsDoNotMatch;
      }
      return ManagerStrings.pleaseEnterYourPassword;
    }

    return null;
  }

  static String? confirmPasswordValidator(
      String? confirmPassword, String originalPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return ManagerStrings.pleaseEnterYourPassword;
    }
    if (confirmPassword != originalPassword) {
      return ManagerStrings.passwordsDoNotMatch;
    }
    return null;
  }

  static String? otpValidator(String? value) {
    final code = value?.trim() ?? '';
    if (code.isEmpty) {
      return 'Invalid code';
    }
    if (!RegExp(r'^\d{4}$').hasMatch(code)) {
      return 'Code must be 4 digits long.';
    }
    return null;
  }

  static String? governorateValidator(String? value) {
    if (value == null) {
      return ManagerStrings.pleaseSelectGovernorate;
    }
    return null;
  }

  static String? wilayaValidator(String? value) {
    if (value == null) {
      return ManagerStrings.pleaseSelectWilaya;
    }
    return null;
  }
}
