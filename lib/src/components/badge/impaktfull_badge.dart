import 'package:impaktfull_ui/impaktfull_ui.dart';

enum ImpaktfullBadgeLocation {
  bottomRight(Alignment.bottomRight),
  bottomLeft(Alignment.bottomLeft),
  topRight(Alignment.topRight),
  topLeft(Alignment.topLeft);

  final Alignment alignment;

  const ImpaktfullBadgeLocation(this.alignment);
}

class ImpaktfullBadge extends StatelessWidget {
  final Widget child;
  final bool showBadge;
  final String? badgeText;
  final ImpaktfullBadgeLocation location;

  const ImpaktfullBadge({
    required this.child,
    this.showBadge = false,
    this.badgeText,
    this.location = ImpaktfullBadgeLocation.topRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showBadge = this.showBadge || badgeText != null;
    return ImpaktfullThemeLocalizer(builder: (context, theme) {
      final textStyle = theme.textStyles.onPrimary.smallBody;
      final textSize = _textWidth(badgeText ?? '', textStyle);
      final textWidth = textSize.width + 12;
      final textHeight = textSize.height;
      return Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            child,
            Positioned(
              top: _getTop(textWidth, textHeight),
              bottom: _getBottom(textWidth, textHeight),
              right: _getRight(textWidth, textHeight),
              left: _getLeft(textWidth, textHeight),
              child: AnimatedOpacity(
                opacity: showBadge ? 1 : 0,
                duration: theme.durations.short,
                child: Transform.scale(
                  scale: 0.75,
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colors.accent1,
                      borderRadius: BorderRadius.circular(
                        theme.dimens.generalBorderRadius,
                      ),
                      border: Border.all(
                        color: theme.colors.canvas,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Builder(
                      builder: (context) {
                        if (badgeText == null) {
                          return Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: theme.colors.accent1,
                              borderRadius: BorderRadius.circular(
                                  theme.dimens.generalBorderRadius),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            badgeText ?? '',
                            style: theme.textStyles.onPrimary.smallBody,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Size _textWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  double? _getTop(double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.bottomCenter ||
        alignment == Alignment.bottomLeft ||
        alignment == Alignment.bottomRight) return null;
    if (badgeText == null) return -4;
    return -(textHeight / 2);
  }

  double? _getBottom(double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.topCenter ||
        alignment == Alignment.topLeft ||
        alignment == Alignment.topRight) return null;
    if (badgeText == null) return -4;
    return -(textHeight / 2);
  }

  double? _getRight(double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.centerLeft ||
        alignment == Alignment.topLeft ||
        alignment == Alignment.bottomLeft) return null;
    if (badgeText == null) return -4;
    return -(textWidth / 2);
  }

  double? _getLeft(double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.centerRight ||
        alignment == Alignment.topRight ||
        alignment == Alignment.bottomRight) return null;
    return -(textWidth / 2);
  }
}
