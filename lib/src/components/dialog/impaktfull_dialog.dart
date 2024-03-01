import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullDialog extends StatelessWidget {
  final String? title;
  final String? body;
  final Widget? child;
  final String? secondaryLabel;
  final String? primaryLabel;
  final VoidCallback? onSecondaryTapped;
  final VoidCallback? onPrimaryTapped;

  const ImpaktfullDialog({
    this.title,
    this.body,
    this.child,
    this.secondaryLabel,
    this.onSecondaryTapped,
    this.primaryLabel,
    this.onPrimaryTapped,
    super.key,
  }) : assert(child != null || title != null || body != null);

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colors.card,
              borderRadius:
                  BorderRadius.circular(theme.dimens.generalBorderRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: theme.textStyles.onCardPrimary.title,
                  ),
                ],
                if (body != null) ...[
                  Text(
                    body!,
                    style: theme.textStyles.onCardPrimary.body,
                  ),
                ],
                if (child != null) child!,
                if (onSecondaryTapped != null || onPrimaryTapped != null) ...[
                  const SizedBox(height: 16),
                  ImpaktfullAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      if (onSecondaryTapped != null) ...[
                        Expanded(
                          child: ImpaktfullButton.secondary(
                            label: secondaryLabel ??
                                theme.localizations.current.generalLabelCancel,
                            onTap: onSecondaryTapped,
                          ),
                        ),
                      ],
                      if (onPrimaryTapped != null) ...[
                        Expanded(
                          child: ImpaktfullButton.primary(
                            label: primaryLabel ??
                                theme.localizations.current.generalLabelAccept,
                            onTap: onPrimaryTapped,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
