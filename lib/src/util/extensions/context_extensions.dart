import 'package:impaktfull_ui/impaktfull_ui.dart';

extension ContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 768;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= 768 &&
      MediaQuery.of(this).size.width < 1024;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}
