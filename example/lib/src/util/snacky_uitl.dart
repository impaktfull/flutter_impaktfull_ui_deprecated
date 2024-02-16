import 'package:impaktfull_ui/impaktfull_ui.dart';

class SnackyUtil {
  const SnackyUtil._();
  static void show(String message) => SnackyController.instance.showMessage(Snacky(
        title: message,
        type: SnackyType.success,
      ));
}
