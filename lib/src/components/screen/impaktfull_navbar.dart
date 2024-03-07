import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_navbar_action.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullNavBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget? bottomNavBarChild;
  final bool isFullScreen;
  final VoidCallback? onBackTapped;

  const ImpaktfullNavBar({
    required this.title,
    this.bottomNavBarChild,
    this.subtitle,
    this.onBackTapped,
    this.isFullScreen = false,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        width: double.infinity,
        color: theme.colors.primary,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 56),
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                    if (!isFullScreen && onBackTapped != null) ...[
                      ImpaktfullNavbarAction(
                        svgIcon: theme.assets.icons.arrowLeft,
                        onTap: onBackTapped,
                      ),
                    ] else ...[
                      const SizedBox(width: 4),
                    ],
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ImpaktfullAutoLayout.vertical(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (title != null) ...[
                              Text(
                                title!,
                                style: theme.textStyles.onPrimary.title,
                              ),
                            ],
                            if (subtitle != null) ...[
                              const SizedBox(height: 2),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  subtitle!,
                                  style: theme.textStyles.onPrimary.smallBody,
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: actions.isEmpty ? 0 : 8),
                    ...actions,
                    if (isFullScreen && onBackTapped != null) ...[
                      ImpaktfullNavbarAction(
                        svgIcon: theme.assets.icons.close,
                        onTap: onBackTapped,
                      ),
                    ],
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              if (bottomNavBarChild != null) bottomNavBarChild!,
            ],
          ),
        ),
      ),
    );
  }
}
