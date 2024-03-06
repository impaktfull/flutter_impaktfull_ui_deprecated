import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_navbar.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_statusbar.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullScreen extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final List<Widget> actions;
  final Widget? bottomNavBarChild;
  final Widget? bottomAction;
  final Alignment fabAlignment;
  final Widget? fab;
  final VoidCallback? onBackTapped;
  final VoidCallback? onPopInvoked;

  const ImpaktfullScreen({
    required this.title,
    required this.child,
    this.actions = const [],
    this.bottomNavBarChild,
    this.subtitle,
    this.onBackTapped,
    this.onPopInvoked,
    this.bottomAction,
    this.fabAlignment = Alignment.bottomRight,
    this.fab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullTheme.of(context);
    return ImpaktfullStatusBar.custom(
      isDark: theme.useDarkStatusBar,
      child: PopScope(
        onPopInvoked: (didPop) => onPopInvoked?.call(),
        child: Scaffold(
          backgroundColor: theme.colors.canvas,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                ImpaktfullNavBar(
                  title: title,
                  subtitle: subtitle,
                  actions: actions,
                  bottomNavBarChild: bottomNavBarChild,
                  onBackTapped: onBackTapped,
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: fabAlignment,
                            children: [
                              child,
                              if (fab != null)
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: fab!,
                                ),
                            ],
                          ),
                        ),
                        if (bottomAction != null) bottomAction!,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
