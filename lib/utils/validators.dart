import 'package:xafe/utils/helpers.dart';
import 'package:xafe/constants/regex.dart';
import 'package:xafe/utils/intl_formatter.dart';

class XfValidators {
  static String? passwordValidator(String password) {
    if (password.length >= 8) return null;

    if (password.isEmpty) return "Password field cannot be empty";

    return "Password cannot be less than eight characters";
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) return "Email field cannot be empty";

    if (!_validateEmail(email)) return "Please enter valid email address";

    return null;
  }

  static String? required(String? text) {
    if (text == null || text.isEmpty) return "This field cannot be empty";

    return null;
  }

  static String? nameValidator(String? name) {
    if (name?.isEmpty ?? true) return "Name field cannot be empty";

    if ((name?.length ?? 0) < 2)
      return "Name cannot be less than two characters";

    return null;
  }

  static String? phoneValidator(String? value, {String countryCode = ""}) {
    if (value == null || value.length == 0) {
      return 'Phone field cannot be left empty';
    }
    if (!phoneRegex.hasMatch("$countryCode$value")) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? amountValidator(
    String? value, {
    num? minAmount,
    num? maxAmount,
  }) {
    if (value?.isEmpty ?? true) {
      return 'Amount cannot be left empty';
    }
    final num? amount = extractAmount(value);
    if (amount == null) {
      return 'Please enter valid amount';
    }
    if (minAmount != null && amount < minAmount) {
      final min = XfFormatter.formatCurrency(minAmount);
      return 'The minumum amount you may enter is $min';
    }
    if (maxAmount != null && amount > maxAmount) {
      final max = XfFormatter.formatCurrency(maxAmount);
      return 'The maximum amount you may enter is $max';
    }
    return null;
  }

  static bool _validateEmail(String value) {
    return (!mailRegEx.hasMatch(value)) ? false : true;
  }
}
