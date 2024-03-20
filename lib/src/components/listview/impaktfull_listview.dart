import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/impaktfull_button.dart';
import 'package:impaktfull_ui/src/components/loading/impaktfull_loading.dart';
import 'package:impaktfull_ui/src/components/refresh_indicator/impaktfull_refresh_indicator.dart';
import 'package:impaktfull_ui/src/components/separator/impaktfull_separator.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullListView<T> extends StatefulWidget {
  final Widget? child;
  final List<Widget>? children;
  final List<T>? items;
  final Widget Function(BuildContext, T)? itemBuilder;
  final EdgeInsetsGeometry extraPadding;
  final double spacing;
  final bool separated;
  final bool? skipPadding;
  final String? noDataLabel;
  final String? refreshBtnLabel;
  final bool isLoading;
  final AsyncCallback? onRefresh;
  final ImpaktfullSeparatorType? separatorType;

  const ImpaktfullListView({
    required this.children,
    this.isLoading = false,
    this.spacing = 0,
    this.onRefresh,
    this.extraPadding = EdgeInsets.zero,
    super.key,
  })  : itemBuilder = null,
        child = null,
        items = null,
        separated = false,
        skipPadding = true,
        noDataLabel = null,
        separatorType = null,
        refreshBtnLabel = null;

  const ImpaktfullListView.builder({
    required this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.spacing = 0,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.extraPadding = EdgeInsets.zero,
    super.key,
  })  : separated = false,
        child = null,
        children = null,
        skipPadding = null,
        separatorType = null;

  const ImpaktfullListView.separated({
    required this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.isLoading = false,
    required ImpaktfullSeparatorType this.separatorType,
    this.refreshBtnLabel,
    this.onRefresh,
    this.extraPadding = EdgeInsets.zero,
    super.key,
    required,
  })  : spacing = 0,
        child = null,
        children = null,
        separated = true,
        skipPadding = null;

  const ImpaktfullListView.child({
    required this.child,
    this.isLoading = false,
    this.refreshBtnLabel,
    this.onRefresh,
    this.extraPadding = EdgeInsets.zero,
    super.key,
    required,
  })  : spacing = 0,
        items = null,
        noDataLabel = null,
        itemBuilder = null,
        separatorType = null,
        children = null,
        separated = true,
        skipPadding = null;

  @override
  State<ImpaktfullListView<T>> createState() => _ImpaktfullListViewState<T>();
}

class _ImpaktfullListViewState<T> extends State<ImpaktfullListView<T>> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: ImpaktfullLoadingIndicator());
    }
    final theme = ImpaktfullTheme.of(context);
    final padding = EdgeInsets.symmetric(
      horizontal: theme.dimens.listViewHorizontalPadding,
      vertical: theme.dimens.listViewVerticalPadding,
    ).add(MediaQuery.of(context).padding).add(widget.extraPadding);
    if (widget.children != null) {
      return ImpaktfullRefreshIndicator(
        onRefresh: widget.onRefresh,
        child: ListView(
          padding: padding,
          children: [
            ImpaktfullAutoLayout.vertical(
              spacing: widget.spacing,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children!,
            ),
          ],
        ),
      );
    }
    if (widget.child != null) {
      return ImpaktfullRefreshIndicator(
        onRefresh: widget.onRefresh,
        child: ListView(
          padding: padding,
          children: [
            widget.child!,
          ],
        ),
      );
    }
    if (widget.items!.isEmpty) {
      return ImpaktfullRefreshIndicator(
        onRefresh: widget.onRefresh,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: widget.onRefresh == null
                ? null
                : const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: constraints.maxHeight,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.noDataLabel!,
                    style: theme.textStyles.onCanvasPrimary.title,
                    textAlign: TextAlign.center,
                  ),
                  if (widget.refreshBtnLabel != null &&
                      widget.onRefresh != null) ...[
                    const SizedBox(height: 16),
                    if (_isLoading) ...[
                      const ImpaktfullLoadingIndicator(),
                    ] else ...[
                      ImpaktfullButton.secondary(
                        label: widget.refreshBtnLabel!,
                        onTap: _onRefreshTapped,
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (widget.separated) {
      return ImpaktfullRefreshIndicator(
        onRefresh: widget.onRefresh,
        child: ListView.separated(
          padding: padding,
          itemBuilder: (context, index) =>
              widget.itemBuilder!(context, widget.items![index]),
          separatorBuilder: (context, index) =>
              ImpaktfullSeparator(type: widget.separatorType!),
          itemCount: widget.items!.length,
        ),
      );
    }
    return ImpaktfullRefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView.separated(
        padding: padding,
        itemBuilder: (context, index) =>
            widget.itemBuilder!(context, widget.items![index]),
        separatorBuilder: (context, index) => SizedBox(height: widget.spacing),
        itemCount: widget.items!.length,
      ),
    );
  }

  Future<void> _onRefreshTapped() async {
    if (widget.onRefresh == null) return;
    setState(() => _isLoading = true);
    try {
      await widget.onRefresh!();
    } catch (e) {
      debugPrint('Error refreshing list: $e');
    }
    setState(() => _isLoading = false);
  }
}
