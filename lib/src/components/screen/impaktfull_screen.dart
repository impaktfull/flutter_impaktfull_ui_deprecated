import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_navbar_action.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_statusbar.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final List<Widget> actions;
  final Widget? bottomNavBarChild;
  final Widget? bottomAction;
  final VoidCallback? onBackTapped;
  final VoidCallback? onPopInvoked;

  const ImpaktfullScreen({
    required String this.title,
    required this.child,
    this.actions = const [],
    this.bottomNavBarChild,
    this.subtitle,
    this.onBackTapped,
    this.onPopInvoked,
    this.bottomAction,
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
          body: Column(
            children: [
              Container(
                width: double.infinity,
                color: theme.colors.primary,
                child: SafeArea(
                  bottom: false,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 56),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            if (onBackTapped != null) ...[
                              ImpaktfullNavbarAction(
                                svgIcon: theme.assets.icons.arrowLeft,
                                onTap: onBackTapped,
                              ),
                            ] else ...[
                              const SizedBox(width: 4),
                            ],
                            const SizedBox(width: 8),
                            Expanded(
                              child: ImpaktfullAutoLayout.vertical(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    title!,
                                    style: theme.textStyles.onPrimary.title,
                                  ),
                                  if (subtitle != null) ...[
                                    const SizedBox(height: 2),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Text(
                                        subtitle!,
                                        style: theme
                                            .textStyles.onPrimary.smallBody,
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                            SizedBox(width: actions.isEmpty ? 0 : 8),
                            ...actions,
                            const SizedBox(width: 8),
                          ],
                        ),
                        if (bottomNavBarChild != null) bottomNavBarChild!,
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: title != null,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
