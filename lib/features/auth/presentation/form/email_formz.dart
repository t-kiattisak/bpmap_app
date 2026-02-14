import 'package:formz/formz.dart';

/// Email form input with Thai error messages.
enum EmailFormzError {
  empty,
  invalid,
}

extension EmailFormzErrorExtension on EmailFormzError {
  String get message {
    switch (this) {
      case EmailFormzError.empty:
        return 'กรุณากรอกอีเมล';
      case EmailFormzError.invalid:
        return 'รูปแบบอีเมลไม่ถูกต้อง';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailFormzError> {
  const EmailFormz.pure() : super.pure('');
  const EmailFormz.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  EmailFormzError? validator(String value) {
    if (value.isEmpty) return EmailFormzError.empty;
    if (!_emailRegex.hasMatch(value)) return EmailFormzError.invalid;
    return null;
  }
}
