import 'package:formz/formz.dart';

enum UsernameValidationError { empty, invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  // Valid email
  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    } else if (!_emailRegExp.hasMatch(value)) {
      return UsernameValidationError.invalid;
    }

    return null;
  }
}

extension UsernameValidationErrorText on UsernameValidationError {
  String? text() {
    switch (this) {
      case UsernameValidationError.invalid:
        return 'Please ensure the email entered is valid';
      case UsernameValidationError.empty:
        return 'Please enter an email';
      default:
        return null;
    }
  }
}
