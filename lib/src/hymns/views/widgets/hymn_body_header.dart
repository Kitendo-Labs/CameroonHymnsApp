import 'package:cameroon_hymn/src/favorites/view/favorites_page.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/hymn_check_box.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HymnsBodyHeader extends ConsumerWidget {
  const HymnsBodyHeader({
    super.key,
    this.title,
    this.onTapCheckMark,
    this.checkboxValue = false,
    required this.hymn,
  });

  final Hymn? hymn;
  final String? title;
  final bool checkboxValue;
  final void Function(bool?)? onTapCheckMark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    final favoriteHymnsNotifier = ref.watch(favoriteHymnsProvider.notifier);
    return Material(
      color: Colors.transparent,
      child: Hero(
        tag: "header",
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 6,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                    color: appColors.onPrimary,
                  ),
                ),
                Expanded(
                  child: title == null
                      ? const SizedBox()
                      : Text(
                          title!,
                          style: const TextStyle(fontSize: 16),
                        ),
                ),
                if (hymn != null)
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      favoriteHymnsNotifier.toggleFavorite(hymn!);

                      final snackBar =
                          (!favoriteHymnsNotifier.isFavorite(hymn!))
                              ? SnackBar(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: appColors.background,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Added hymn to favorites',
                                    style: TextStyle(color: appColors.primary),
                                  ),
                                  action: SnackBarAction(
                                    label: 'view',
                                    textColor: appColors.secondary,
                                    onPressed: () {
                                      try {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const FavoritesPage();
                                            },
                                          ),
                                        );
                                      } catch (e) {
                                        navigatorKey.currentState!.push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const FavoritesPage();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                              : SnackBar(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: appColors.background,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Removed from favorites',
                                    style: TextStyle(color: appColors.primary),
                                  ),
                                );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      ref.watch(favoriteHymnsProvider).contains(hymn!)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 24,
                      color: appColors.onPrimary,
                    ),
                  ),
                if (onTapCheckMark != null)
                  HymnCheckBox(
                    checkboxValue: checkboxValue,
                    onTapCheckMark: onTapCheckMark,
                  ),
                IconButton(
                  onPressed: () {
                    ref
                        .watch(themeModeNotifierProvider.notifier)
                        .update(Theme.of(context).brightness);
                  },
                  icon: Icon(
                    switch (ref.watch(themeModeNotifierProvider)) {
                      ThemeMode.dark => Icons.wb_sunny_rounded,
                      ThemeMode.light => Icons.wb_sunny_outlined,
                      ThemeMode.system => Icons.sunny,
                    },
                    size: 24,
                    color: appColors.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
