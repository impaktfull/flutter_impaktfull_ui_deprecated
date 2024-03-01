import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullBottomNavigationItem extends StatelessWidget {
  final String label;
  final String svgIcon;
  final String? svgIconSelected;
  final bool isSelected;
  final VoidCallback onTap;

  const ImpaktfullBottomNavigationItem({
    required this.label,
    required this.svgIcon,
    required this.isSelected,
    required this.onTap,
    this.svgIconSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ImpaktfullThemeLocalizer(
        builder: (context, theme) => ImpaktfullTouchFeedback(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                const SizedBox(height: 8),
                ImpaktfullSvgIcon(
                  asset: isSelected ? svgIconSelected ?? svgIcon : svgIcon,
                  color:
                      isSelected ? theme.colors.accent1 : theme.colors.primary,
                ),
                Text(
                  label,
                  style: theme.textStyles.onCanvasPrimary.smallBody.copyWith(
                    color: isSelected
                        ? theme.colors.accent1
                        : theme.colors.primary,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
