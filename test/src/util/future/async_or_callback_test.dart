// ignore_for_file: prefer_function_declarations_over_variables, unnecessary_type_check

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/future/async_or_callback.dart';

void main() {
  test('AsyncCallback', () {
    final AsyncOrCallback callback = () async {};
    expect(callback is Future<void> Function(), true);
    expect(callback is AsyncCallback, true);
  });
  test('VoidCallback', () {
    final AsyncOrCallback callback = () {};
    expect(callback is Future<void> Function(), false);
    expect(callback is AsyncCallback, false);
    expect(callback is void Function(), true);
    expect(callback is VoidCallback, true);
  });
}
