import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/loading/impaktfull_loading.dart';
import 'package:impaktfull_ui/src/components/separator/impaktfull_separator.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullListView<T> extends StatelessWidget {
  final List<Widget>? children;
  final List<T>? items;
  final Widget Function(BuildContext, T)? itemBuilder;
  final double spacing;
  final bool separated;
  final bool? skipPadding;
  final String? noDataLabel;
  final bool isLoading;
  final ImpaktfullSeparatorType? separatorType;

  const ImpaktfullListView({
    required this.children,
    this.isLoading = false,
    this.spacing = 0,
    super.key,
  })  : itemBuilder = null,
        items = null,
        separated = false,
        skipPadding = true,
        noDataLabel = null,
        separatorType = null;

  const ImpaktfullListView.builder({
    required this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.spacing = 0,
    this.isLoading = false,
    super.key,
  })  : separated = false,
        children = null,
        skipPadding = null,
        separatorType = null;

  const ImpaktfullListView.separated({
    required this.items,
    required this.itemBuilder,
    required String this.noDataLabel,
    this.isLoading = false,
    required ImpaktfullSeparatorType this.separatorType,
    super.key,
    required,
  })  : spacing = 0,
        children = null,
        separated = true,
        skipPadding = null;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: ImpaktfullLoadingIndicator());
    final theme = ImpaktfullTheme.of(context);
    final padding = EdgeInsets.symmetric(
      horizontal: theme.dimens.listViewHorizontalPadding,
      vertical: theme.dimens.listViewVerticalPadding,
    ).add(MediaQuery.of(context).padding);
    if (children != null) {
      return ListView(
        padding: padding,
        children: [
          ImpaktfullAutoLayout.vertical(
            spacing: spacing,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children!,
          ),
        ],
      );
    }
    if (items!.isEmpty) {
      return Center(
        child: Text(
          noDataLabel!,
          style: theme.textStyles.onCanvasPrimary.title,
        ),
      );
    }
    if (separated) {
      return ListView.separated(
        padding: padding,
        itemBuilder: (context, index) => itemBuilder!(context, items![index]),
        separatorBuilder: (context, index) =>
            ImpaktfullSeparator(type: separatorType!),
        itemCount: items!.length,
      );
    }
    return ListView.separated(
      padding: padding,
      itemBuilder: (context, index) => itemBuilder!(context, items![index]),
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemCount: items!.length,
    );
  }
}
