import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullTabBarItem extends StatefulWidget {
  final String label;
  final int index;
  final TabController tabController;

  const ImpaktfullTabBarItem({
    required this.label,
    required this.index,
    required this.tabController,
    super.key,
  });

  @override
  State<ImpaktfullTabBarItem> createState() => _ImpaktfullTabBarItemState();
}

class _ImpaktfullTabBarItemState extends State<ImpaktfullTabBarItem> {
  @override
  void initState() {
    widget.tabController.addListener(_onTabChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ImpaktfullThemeLocalizer(
        builder: (context, theme) => ImpaktfullTouchFeedback(
          onTap: () => widget.tabController.animateTo(widget.index),
          child: Container(
            color: theme.colors.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: ImpaktfullAutoLayout.vertical(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: theme.textStyles.onPrimary.button,
                ),
                AnimatedOpacity(
                  opacity: widget.index == widget.tabController.index ? 1 : 0,
                  duration: theme.durations.short,
                  curve: Curves.easeInOut,
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      color: theme.textStyles.onPrimary.body.color,
                      borderRadius: BorderRadius.circular(
                          theme.dimens.generalBorderRadius),
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

  void _onTabChanged() => setState(() {});
}
