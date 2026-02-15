import 'package:formz/formz.dart';

/// Password form input with Thai error messages.
enum PasswordFormzError {
  empty,
}

extension PasswordFormzErrorExtension on PasswordFormzError {
  String get message {
    switch (this) {
      case PasswordFormzError.empty:
        return 'กรุณากรอกรหัสผ่าน';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordFormzError> {
  const PasswordFormz.pure() : super.pure('');
  const PasswordFormz.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordFormzError? validator(String value) {
    if (value.isEmpty) return PasswordFormzError.empty;
    return null;
  }
}
