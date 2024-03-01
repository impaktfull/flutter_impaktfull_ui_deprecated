import 'dart:io';

class TestUtil {
  TestUtil._();

  static bool get isInTest => Platform.environment.containsKey('FLUTTER_TEST');
}
