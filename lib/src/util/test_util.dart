import 'package:universal_io/io.dart';

class TestUtil {
  TestUtil._();

  static bool get isInTest => Platform.environment.containsKey('FLUTTER_TEST');
}
