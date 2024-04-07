import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullNavbarAction extends StatelessWidget {
  final String svgIcon;
  final VoidCallback? onTap;
  final bool useThemeColor;

  const ImpaktfullNavbarAction({
    required this.svgIcon,
    required this.onTap,
    this.useThemeColor = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        color: theme.colors.primary,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullSvgIcon(
            asset: svgIcon,
            color: useThemeColor ? theme.colors.onPrimary : null,
          ),
        ),
      ),
    );
  }
}
