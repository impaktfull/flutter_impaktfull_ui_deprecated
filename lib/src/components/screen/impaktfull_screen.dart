import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_navbar.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_statusbar.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final List<Widget> actions;
  final Widget? bottomNavBarChild;
  final Widget? bottomAction;
  final Alignment fabAlignment;
  final Widget? fab;
  final VoidCallback? onBackTapped;
  final VoidCallback? onPopInvoked;
  final bool isFullScreen;

  const ImpaktfullScreen({
    required this.child,
    this.title,
    this.actions = const [],
    this.bottomNavBarChild,
    this.subtitle,
    this.onBackTapped,
    this.onPopInvoked,
    this.bottomAction,
    this.fabAlignment = Alignment.bottomRight,
    this.fab,
    this.isFullScreen = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullTheme.of(context);
    final hasNavBar = title != null ||
        subtitle != null ||
        actions.isNotEmpty ||
        onBackTapped != null ||
        bottomNavBarChild != null;
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
                if (hasNavBar) ...[
                  ImpaktfullNavBar(
                    title: title,
                    subtitle: subtitle,
                    actions: actions,
                    bottomNavBarChild: bottomNavBarChild,
                    isFullScreen: isFullScreen,
                    onBackTapped: onBackTapped,
                  ),
                ],
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: hasNavBar,
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
