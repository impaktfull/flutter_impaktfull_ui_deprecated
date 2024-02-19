import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/base_list_item.dart';
import 'package:impaktfull_ui/src/components/loading/impaktfull_loading.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullListItem extends StatefulWidget {
  final String title;
  final String? leadingAsset;
  final String? subTitle;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;

  const ImpaktfullListItem({
    required this.title,
    this.leadingAsset,
    this.onTap,
    this.onAsyncTap,
    this.subTitle,
    super.key,
  });

  @override
  State<ImpaktfullListItem> createState() => _ImpaktfullListItemState();
}

class _ImpaktfullListItemState extends State<ImpaktfullListItem> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => BaseListItem(
        title: widget.title,
        subTitle: widget.subTitle,
        onTap: widget.onAsyncTap != null ? _onAsyncTap : widget.onTap,
        leadingWidget: widget.leadingAsset == null
            ? null
            : ImpaktfullSvgIcon(
                asset: widget.leadingAsset!,
                size: 16,
                color: theme.colors.primary,
              ),
        trailingWidget: Builder(builder: (context) {
          if (widget.onTap != null || widget.onAsyncTap != null) {
            if (_isLoading) {
              return SizedBox(
                width: widget.subTitle == null ? 24 : 32,
                height: widget.subTitle == null ? 24 : 32,
                child: const ImpaktfullLoadingIndicator(),
              );
            }
            return const SizedBox();
          } else {
            return ImpaktfullSvgIcon(
              asset: theme.assets.icons.chevronRight,
              color: theme.colors.primary,
            );
          }
        }),
      ),
    );
  }

  Future<void> _onAsyncTap() async {
    _isLoading = true;
    setState(() {});
    try {
      await widget.onAsyncTap!();
      _isLoading = false;
      setState(() {});
    } catch (error) {
      _isLoading = false;
      setState(() {});
      rethrow;
    }
  }
}
