import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_simple_list_item.dart';
import 'package:impaktfull_ui/src/components/loading/impaktfull_loading.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';
import 'package:impaktfull_ui/src/util/asset_util.dart';

class ImpaktfullListItem extends StatefulWidget {
  final String title;
  final String? leadingAsset;
  final String? subTitle;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final bool danger;

  const ImpaktfullListItem({
    required this.title,
    this.leadingAsset,
    this.onTap,
    this.onAsyncTap,
    this.subTitle,
    super.key,
  }) : danger = false;

  const ImpaktfullListItem.danger({
    required this.title,
    this.leadingAsset,
    this.onTap,
    this.onAsyncTap,
    this.subTitle,
    super.key,
  }) : danger = true;

  @override
  State<ImpaktfullListItem> createState() => _ImpaktfullListItemState();
}

class _ImpaktfullListItemState extends State<ImpaktfullListItem> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullSimpleListItem(
        title: widget.title,
        subTitle: widget.subTitle,
        danger: widget.danger,
        onTap:
            widget.onAsyncTap == null && widget.onTap == null ? null : _onTap,
        leadingWidget: widget.leadingAsset == null
            ? null
            : ImpaktfullSvgIcon(
                asset: widget.leadingAsset!,
                size: 16,
                color: _getLeadingColor(theme),
              ),
        trailingWidget: widget.onTap != null || widget.onAsyncTap != null
            ? Builder(
                builder: (context) {
                  if (_isLoading) {
                    return SizedBox(
                      width: widget.subTitle == null ? 24 : 32,
                      height: widget.subTitle == null ? 24 : 32,
                      child: const ImpaktfullLoadingIndicator(),
                    );
                  }
                  return ImpaktfullSvgIcon(
                    asset: theme.assets.icons.chevronRight,
                    color: theme.colors.primary,
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }
    _onAsyncTap();
  }

  Future<void> _onAsyncTap() async {
    _isLoading = true;
    setState(() {});
    try {
      await widget.onAsyncTap!();
      if (!mounted) return;
      _isLoading = false;
      setState(() {});
    } catch (error) {
      if (!mounted) return;
      _isLoading = false;
      setState(() {});
      rethrow;
    }
  }

  Color? _getLeadingColor(ImpaktfullTheme theme) {
    if (!AssetUtil.isIcon(widget.leadingAsset!)) {
      return null;
    }
    if (widget.danger) return theme.colors.danger;
    return theme.colors.primary;
  }
}
