import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/utils/extentions.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.category,
    this.onTap,
  });

  final int index;
  final int activeIndex;
  final void Function(int index)? onTap;
  final HymnTitle? category;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(index),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == activeIndex ? appColors.secondary : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category == null
              ? 'All'
              : category?.title.capitalizeFirstLetter() ?? 'N/A',
          style: TextStyle(
            color: index == activeIndex ? appColors.accentSecondary : null,
          ),
        ),
      ),
    );
  }
}
