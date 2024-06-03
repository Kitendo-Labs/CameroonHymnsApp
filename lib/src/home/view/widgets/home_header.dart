import 'package:cameroon_hymn/src/home/view/widgets/hymn_search_form_field.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shouldExpand = StateProvider((ref) => false);

class Header extends ConsumerStatefulWidget {
  const Header({
    super.key,
    required this.title,
    this.showReturn = false,
  });

  final String title;
  final bool showReturn;

  @override
  ConsumerState<Header> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  late FocusNode searchNode;
  bool canPop = false;
  @override
  void initState() {
    searchNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    final shouldShowSearch = ref.watch(showSearchProvider);
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (ref.watch(searchedTermProvider).isNotEmpty ||
            ref.watch(showSearchProvider)) {
          ref.watch(searchedTermProvider.notifier).update((state) => '');
          ref.watch(showSearchProvider.notifier).update((state) => false);
        }
        setState(() {
          canPop = true;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: Hero(
          tag: "header",
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 1),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              child: (shouldShowSearch)
                                  ? AnimatedContainer(
                                      height: 40,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.decelerate,
                                      width: ref.watch(shouldExpand)
                                          ? MediaQuery.sizeOf(context).width -
                                              84
                                          : 40,
                                      decoration: BoxDecoration(
                                        color: ref.watch(shouldExpand)
                                            ? appColors.secondary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onEnd: () {
                                        searchNode.requestFocus();
                                      },
                                      child: SearchedTermFormField(
                                        searchNode: searchNode,
                                      ),
                                    )
                                  : Text(
                                      widget.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: appColors.onPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.decelerate,
                            alignment: shouldShowSearch
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            onEnd: () {
                              ref
                                  .watch(shouldExpand.notifier)
                                  .update((state) => !state);
                            },
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .watch(searchedTermProvider.notifier)
                                    .update((state) => '');
                                ref
                                    .watch(showSearchProvider.notifier)
                                    .update((state) => !state);
                              },
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              icon: Icon(
                                Icons.search,
                                size: 24,
                                color: appColors.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 30,
                      child: IconButton(
                        onPressed: () {
                          ref
                              .watch(themeModeNotifierProvider.notifier)
                              .update(Theme.of(context).brightness);
                        },
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
