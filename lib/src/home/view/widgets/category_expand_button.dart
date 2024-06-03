import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/home/view/widgets/categories_search_form_field.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/utils/extentions.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryExpandButton extends ConsumerStatefulWidget {
  const CategoryExpandButton({
    super.key,
  });

  @override
  ConsumerState<CategoryExpandButton> createState() =>
      _CategoryExpandButtonState();
}

class _CategoryExpandButtonState extends ConsumerState<CategoryExpandButton> {
  List<HymnTitle?>? searchedHymns;
  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    final hymnListProvider = ref.watch(getHymnsProvider);
    final hymnList = hymnListProvider is AsyncLoading
        ? HymnsList.fromJson({'hymns': [], 'categories': []})
        : hymnListProvider.requireValue;
    final categoriesList = searchedHymns ?? hymnList.categories;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          backgroundColor: appColor.onSurface,
          barrierColor: appColor.surface,
          isDismissible: false,
          isScrollControlled: true,
          builder: (context) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.viewInsetsOf(context).bottom,
                ),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ExpandBody(categoriesList: categoriesList),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                appColor.onBackground,
                                appColor.onSurface,
                                appColor.onSurface,
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              color: appColor.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appColor.secondary,
        ),
        child: const Icon(
          Icons.expand_circle_down_outlined,
          size: 18,
        ),
      ),
    );
  }
}

class ExpandBody extends ConsumerStatefulWidget {
  const ExpandBody({super.key, required this.categoriesList});
  final List<HymnTitle?> categoriesList;
  @override
  ConsumerState<ExpandBody> createState() => _ExpandBodyState();
}

class _ExpandBodyState extends ConsumerState<ExpandBody> {
  List<HymnTitle?>? searchedCategories;

  @override
  void initState() {
    searchedCategories = widget.categoriesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    return Padding(
      padding: const EdgeInsets.only(top: 32) +
          const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SearchTextFormFieldOutline(
            onChanged: (String searchValue) {
              setState(() {
                searchedCategories = widget.categoriesList.where((element) {
                  final s = element!.title.toLowerCase();
                  return s.contains(searchValue.toLowerCase());
                }).toList();
              });
            },
          ),
          const SizedBox(height: 18),
          Expanded(
            child: RawScrollbar(
              thumbColor: appColor.accent,
              radius: const Radius.circular(16),
              thickness: 6,
              padding: const EdgeInsets.only(bottom: 46),
              child: GlowingOverscrollIndicator(
                color: appColor.accent,
                axisDirection: AxisDirection.down,
                child: ListView.builder(
                  itemCount: (searchedCategories?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    final category = index == searchedCategories?.length
                        ? null
                        : searchedCategories![index];
                    return GestureDetector(
                      onTap: () {
                        ref
                            .watch(hymnListPageControllerProvider)
                            .jumpToPage(index + 1);
                        ref
                            .watch(selectedHymnCategory.notifier)
                            .update((state) => category);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          category?.title.toLowerCase().capitalize() ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: appColor.onPrimary,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
