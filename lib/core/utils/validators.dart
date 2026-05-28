import 'package:easy_localization/easy_localization.dart';
import 'constants/app_strings.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.emailIsRequired.tr();
    }
    final cleanValue = value.trim();
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(cleanValue)) {
      return AppString.pleaseEnterAValidEmailAddress.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.passwordIsRequired.tr();
    }
    if (value.length < 8) {
      return AppString.passwordMustBeAtLeast8CharactersLong.tr();
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppString.passwordMustContainAtLeastOneUppercaseLetter.tr();
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return AppString.passwordMustContainAtLeastOneLowercaseLetter.tr();
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppString.passwordMustContainAtLeastOneNumber.tr();
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppString.passwordMustContainAtLeastOneSpecialCharacter.tr();
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.isRequired.tr();
    }
    if (value.length < 4) {
      return AppString.mustBeAtLeast4NumberLong.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppString.pleaseConfirmYourPassword.tr();
    }
    if (value != password) {
      return AppString.passwordsDoNotMatch.tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.phoneNumberIsRequired.tr();
    }
    final cleanNumber = value.replaceAll(RegExp(r'[^\d]'), '');
    final iraqiPhoneRegex = RegExp(r'^07\d{9}$');
    if (!iraqiPhoneRegex.hasMatch(cleanNumber)) {
      return AppString.pleaseEnterAValidPhoneNumber.tr();
    }
    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName ${AppString.isRequired.tr()}';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.usernameIsRequired.tr();
    }
    if (value.length < 3) {
      return AppString.usernameMustBeAtLeast3CharactersLong.tr();
    }
    if (value.length > 500) {
      return AppString.usernameMustBeLessThan500Characters.tr();
    }
    return null;
  }

  static String? validateReferralCode(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length < 3) {
        return AppString.referralCodeMustBeAtLeast3CharactersLong.tr();
      }
    }
    return null;
  }

  static String? validateTermsAgreement(bool? value) {
    if (value == null || !value) {
      return AppString.youMustAgreeToTheTermsAndConditions.tr();
    }
    return null;
  }

  static String? optional({
    required String? value,
    required String? Function(String value) validate,
  }) {
    if (value == null || value.isEmpty) return null;
    return validate(value);
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${AppString.firstName.tr()} ${AppString.isRequired.tr()}';
    }
    if (value.trim().length < 3) {
      return AppString.firstNameMustBeAtLeast3CharactersLong.tr();
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${AppString.lastName.tr()} ${AppString.isRequired.tr()}';
    }
    if (value.trim().length < 3) {
      return AppString.lastNameMustBeAtLeast3CharactersLong.tr();
    }
    return null;
  }
}