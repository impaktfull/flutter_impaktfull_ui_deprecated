import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/screen/impaktfull_navbar_action.dart';

class ImpaktfullNavBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget? bottomNavBarChild;
  final VoidCallback? onBackTapped;

  const ImpaktfullNavBar({
    required String this.title,
    this.actions = const [],
    this.bottomNavBarChild,
    this.subtitle,
    this.onBackTapped,
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
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 56),
                child: Row(
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
                                style: theme.textStyles.onPrimary.smallBody,
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
              ),
              if (bottomNavBarChild != null) bottomNavBarChild!,
            ],
          ),
        ),
      ),
    );
  }
}
