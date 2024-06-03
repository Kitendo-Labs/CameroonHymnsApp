import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/hymn_check_box.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/hymns/views/pages/hymn_details_page.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/hymn_body_header.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

final showSlider = StateProvider((ref) => false);
final showCheckMarks = StateProvider.autoDispose((ref) => false);
final selectedHymns = StateProvider<List<Hymn?>>((ref) => []);

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.watch(favoriteHymnsProvider.notifier).getFavoriteHymns();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;

    final favorites = ref.watch(favoriteHymnsProvider);

    return Scaffold(
      backgroundColor: appColors.primary,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            margin: EdgeInsets.only(
              right: 30,
              bottom: ref.watch(homeBottomSize) - 30,
            ),
            padding: EdgeInsets.only(
              bottom: 40,
              top: MediaQuery.sizeOf(context).height * 0.14,
            ),
            decoration: BoxDecoration(
              color: appColors.secondary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(90),
              ),
            ),
            child: favorites.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/no_favorites.svg",
                        height: 100,
                        colorFilter: ColorFilter.mode(
                          appColors.onPrimary.withOpacity(0.6),
                          BlendMode.srcIn,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text("No favourite hymns found"),
                      ),
                      const SizedBox(height: 100),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: RawScrollbar(
                          thumbColor: appColors.accent,
                          radius: const Radius.circular(16),
                          thickness: 6,
                          padding: const EdgeInsets.only(
                              right: 10, bottom: 10, top: 10),
                          child: GlowingOverscrollIndicator(
                            color: appColors.accent,
                            axisDirection: AxisDirection.down,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                right: 20,
                                left: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: favorites
                                    .map(
                                      (e) => AnimatedDefaultTextStyle(
                                        duration: Duration(
                                            milliseconds: ref
                                                .watch(textAnimationDuration)),
                                        curve: ref.watch(textCurve),
                                        style: TextStyle(
                                          color: appColors.onPrimary,
                                          fontSize: 14,
                                          height: 1.50,
                                        ),
                                        child: FavoriteItem(hymn: e!),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ref.watch(appPaddingProvider).top,
              bottom: 20,
            ),
            child: HymnsBodyHeader(
              hymn: null,
              title: 'Favorites',
              checkboxValue: ref.watch(showCheckMarks),
              onTapCheckMark: favorites.isEmpty
                  ? null
                  : (value) {
                      if (!ref.watch(showCheckMarks)) {
                        ref
                            .watch(selectedHymns.notifier)
                            .update((state) => favorites);
                      } else {
                        ref.watch(selectedHymns.notifier).update((state) => []);
                      }
                      ref
                          .watch(showCheckMarks.notifier)
                          .update((state) => value!);
                    },
            ),
          ),
          const BottomMaybeButton(),
        ],
      ),
    );
  }
}

final showText = StateProvider((ref) => false);

class BottomMaybeButton extends ConsumerWidget {
  const BottomMaybeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    return AnimatedPositioned(
      bottom: ref.watch(homeBottomSize) - 30,
      right: 0,
      left:
          ref.watch(showCheckMarks) ? 0 : MediaQuery.sizeOf(context).width - 80,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutBack,
      onEnd: () {
        ref.watch(showText.notifier).update((state) => !state);
      },
      child: Column(
        children: [
          FloatingActionButton(
            onPressed: ref.watch(showCheckMarks)
                ? () async {
                    final removeHymnList = ref.watch(selectedHymns);
                    for (Hymn? removeHymn in removeHymnList) {
                      await ref
                          .watch(favoriteHymnsProvider.notifier)
                          .toggleFavorite(removeHymn!);
                      await Future.delayed(const Duration(milliseconds: 400));
                    }
                    ref.invalidate(selectedHymns);
                    ref.watch(showCheckMarks.notifier).update((state) => false);
                  }
                : null,
            shape: const CircleBorder(),
            elevation: ref.watch(showCheckMarks) ? null : 0.0,
            backgroundColor: appColors.accent,
            foregroundColor: appColors.onAccent,
            child: ref.watch(showCheckMarks)
                ? const Icon(CupertinoIcons.delete)
                : Padding(
                    padding: EdgeInsets.only(
                      left: !ref.watch(showPlayer) ? 4.0 : 0,
                    ),
                  ),
          ),
          if (ref.watch(showCheckMarks))
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              child: (ref.watch(showText))
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Remove selected"),
                    )
                  : const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }
}

class FavoriteItem extends ConsumerWidget {
  const FavoriteItem({
    super.key,
    required this.hymn,
  });

  final Hymn hymn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    final hymns = ref.watch(selectedHymns);
    final contains = hymns.contains(hymn);
    return GestureDetector(
      onTap: (ref.watch(showCheckMarks))
          ? () {
              if (contains) {
                ref.read(selectedHymns.notifier).update((state) =>
                    state.where((newHymn) => newHymn!.id != hymn.id).toList());
              } else {
                ref
                    .read(selectedHymns.notifier)
                    .update((state) => [...state, hymn]);
              }
            }
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HymnDetailsPage(
                      hymn: hymn,
                    );
                  },
                ),
              );
            },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: appColors.surface,
          border: contains ? Border.all(color: appColors.background) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hymn.title,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            (ref.watch(showCheckMarks))
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: Consumer(builder: (context, ref, _) {
                      return HymnCheckBox(
                        checkboxValue: contains,
                        onTapCheckMark: (value) {},
                      );
                    }),
                  )
                : IconButton(
                    onPressed: () {
                      ref
                          .watch(favoriteHymnsProvider.notifier)
                          .toggleFavorite(hymn);
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: appColors.onPrimary,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
