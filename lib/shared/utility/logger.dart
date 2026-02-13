import 'package:flutter/foundation.dart';

/// Simple debug logger (no Riverpod dependency).
void logUpdate(String name, Object? newValue) {
  if (kDebugMode) {
    print('''
{
  "name": "$name",
  "newValue": "$newValue"
}''');
  }
}
