import 'package:cameroon_hymn/src/home/view/widgets/category_item.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

const categoriesAnimationTime = Duration(milliseconds: 800);
const categoriesAnimationTimeShort = Duration(milliseconds: 500);

class Categories extends ConsumerStatefulWidget {
  const Categories({
    super.key,
  });

  @override
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  late AutoScrollController controller;
  int activeIndex = 0;
  @override
  void initState() {
    controller = AutoScrollController(
      axis: Axis.horizontal,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<HymnTitle?>? categoriesList =
        ref.watch(getCategoriesListProvider).value;
    ref.listen(selectedHymnCategory, (previous, next) {
      final selectedIndex = (categoriesList == null || categoriesList.isEmpty)
          ? 0
          : categoriesList.indexOf(next);
      setState(() {
        activeIndex = selectedIndex + 1;
      });
      controller.scrollToIndex(activeIndex,
          duration: categoriesAnimationTime,
          preferPosition: AutoScrollPosition.begin);
    });

    return ListView.builder(
      itemCount: (categoriesList?.length ?? 0) + 1,
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemBuilder: (context, index) {
        final categoryList = categoriesList ?? [];
        final category = index == 0 ? null : categoryList[index - 1];

        return AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: CategoryItem(
            index: index,
            activeIndex: activeIndex,
            category: category,
            onTap: (index) {
              ref.watch(hymnListPageControllerProvider).jumpToPage(index);
              ref
                  .watch(selectedHymnCategory.notifier)
                  .update((state) => category);
            },
          ),
        );
      },
    );
  }
}
