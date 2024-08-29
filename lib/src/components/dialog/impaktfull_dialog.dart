import 'package:flutter/foundation.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/future/async_or_callback.dart';

class ImpaktfullDialog extends StatelessWidget {
  final String? title;
  final String? body;
  final Widget? child;
  final String? secondaryLabel;
  final String? primaryLabel;
  final ImpaktfullDialogPrimaryButtonType primaryButtonType;
  final AsyncOrCallback? onSecondaryTapped;
  final AsyncOrCallback? onPrimaryTapped;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ImpaktfullDialog({
    this.title,
    this.body,
    this.child,
    this.secondaryLabel,
    this.onSecondaryTapped,
    this.primaryLabel,
    this.onPrimaryTapped,
    this.primaryButtonType = ImpaktfullDialogPrimaryButtonType.primary,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(16),
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
            margin: margin,
            padding: padding,
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
                            onTap: onSecondaryTapped is AsyncCallback
                                ? null
                                : onSecondaryTapped as VoidCallback,
                            onAsyncTap: onSecondaryTapped is AsyncCallback
                                ? onSecondaryTapped as AsyncCallback
                                : null,
                          ),
                        ),
                      ],
                      if (onPrimaryTapped != null) ...[
                        if (primaryButtonType ==
                            ImpaktfullDialogPrimaryButtonType.primary) ...[
                          Expanded(
                            child: ImpaktfullButton.primary(
                              label: primaryLabel ??
                                  theme
                                      .localizations.current.generalLabelAccept,
                              onTap: onPrimaryTapped is AsyncCallback
                                  ? null
                                  : onPrimaryTapped as VoidCallback,
                              onAsyncTap: onPrimaryTapped is AsyncCallback
                                  ? onPrimaryTapped as AsyncCallback
                                  : null,
                            ),
                          ),
                        ] else if (primaryButtonType ==
                            ImpaktfullDialogPrimaryButtonType.accent) ...[
                          Expanded(
                            child: ImpaktfullButton.accent(
                              label: primaryLabel ??
                                  theme
                                      .localizations.current.generalLabelAccept,
                              onTap: onPrimaryTapped is AsyncCallback
                                  ? null
                                  : onPrimaryTapped as VoidCallback,
                              onAsyncTap: onPrimaryTapped is AsyncCallback
                                  ? onPrimaryTapped as AsyncCallback
                                  : null,
                            ),
                          ),
                        ] else if (primaryButtonType ==
                            ImpaktfullDialogPrimaryButtonType.danger) ...[
                          Expanded(
                            child: ImpaktfullButton.danger(
                              label: primaryLabel ??
                                  theme
                                      .localizations.current.generalLabelAccept,
                              onTap: onPrimaryTapped is AsyncCallback
                                  ? null
                                  : onPrimaryTapped as VoidCallback,
                              onAsyncTap: onPrimaryTapped is AsyncCallback
                                  ? onPrimaryTapped as AsyncCallback
                                  : null,
                            ),
                          ),
                        ],
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

enum ImpaktfullDialogPrimaryButtonType {
  primary,
  accent,
  danger,
}
