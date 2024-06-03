import 'package:cameroon_hymn/src/home/services/package_info.dart';
import 'package:cameroon_hymn/src/home/services/remote_config.dart';
import 'package:cameroon_hymn/src/home/view/widgets/app_update.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/home/view/widgets/categories_row.dart';
import 'package:cameroon_hymn/src/home/view/widgets/category_expand_button.dart';
import 'package:cameroon_hymn/src/home/view/widgets/home_footer.dart';
import 'package:cameroon_hymn/src/home/view/widgets/home_header.dart';
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/hymns/views/pages/hymn_details_page.dart';
import 'package:cameroon_hymn/src/utils/helpers.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    Future.microtask(
      () async {
        ref.read(appPaddingProvider.notifier).update(
              (state) => MediaQuery.paddingOf(context),
            );
        final configVersion = ref.watch(appConfigProvider).appVersion;
        final currentVersion = ref.watch(appInfoProvider).appVersion;
        final compare = compareVersions(configVersion, currentVersion);
        final appColor = Theme.of(context).appColors;

        switch (compare) {
          case Compare.greaterThan:
            showAppUpdate(appColor, context);
          default:
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    List<HymnTitle?>? categoriesList =
        ref.watch(getCategoriesListProvider).value;

    return Scaffold(
      backgroundColor: appColors.primary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 12, right: 16, left: 16),
          child: Column(
            children: [
              Header(title: widget.title),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          width: constraints.maxWidth,
                          top: 2,
                          right: -(constraints.maxWidth / 2) + 25,
                          child: Dash(
                            direction: Axis.vertical,
                            length: 88,
                            dashLength: 3,
                            dashThickness: 2,
                            dashColor: appColors.secondary,
                          ),
                        ),
                        Positioned(
                          height: 50,
                          width: constraints.maxWidth,
                          top: 24,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Categories()),
                              SizedBox(width: 12),
                              CategoryExpandButton(),
                              SizedBox(width: 2),
                            ],
                          ),
                        ),
                        Positioned(
                          height: constraints.maxHeight - 88,
                          width: constraints.maxWidth,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 24) +
                                const EdgeInsets.only(left: 0, right: 4),
                            decoration: BoxDecoration(
                              color: appColors.secondary,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(20),
                                left: Radius.circular(20),
                              ),
                            ),
                            child: PageView.builder(
                              controller:
                                  ref.watch(hymnListPageControllerProvider),
                              itemCount: categoriesList?.length ?? 0,
                              itemBuilder: (context, index) =>
                                  const HymnsListView(),
                              onPageChanged: (index) {
                                final category = index == 0
                                    ? null
                                    : categoriesList![index - 1];
                                ref
                                    .watch(selectedHymnCategory.notifier)
                                    .update((state) => category);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const HomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class HymnsListView extends ConsumerWidget {
  const HymnsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hymnListProvider = ref.watch(getHymnsListProvider);
    final hymns =
        hymnListProvider is AsyncLoading ? null : hymnListProvider.requireValue;
    final otherHymnListProvider = ref.watch(getOtherHymnsListProvider);
    final otherHymns = hymnListProvider is AsyncLoading
        ? null
        : otherHymnListProvider.requireValue;
    final hymnsLength = (hymns?.length ?? 0);
    final appColors = Theme.of(context).appColors;
    return RawScrollbar(
      thumbColor: appColors.accent,
      radius: const Radius.circular(16),
      thickness: 6,
      padding: const EdgeInsets.only(right: 10, bottom: 4),
      child: GlowingOverscrollIndicator(
        color: appColors.accent,
        axisDirection: AxisDirection.down,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 8),
          itemCount: hymnsLength +
              (((otherHymns?.isEmpty ?? true) || hymnsLength > 5) ? 0 : 1),
          itemBuilder: (context, index) {
            if (hymns == null || (index >= hymns.length && hymns.length < 5)) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hymns == null || hymns.isEmpty)
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "No results found in this category",
                        style: TextStyle(
                          color: appColors.onPrimary,
                        ),
                      ),
                    ),
                  if (!listEquals(otherHymns, hymns))
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      margin: const EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                        color: appColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Other Categories",
                        style: TextStyle(
                          color: appColors.onPrimary,
                        ),
                      ),
                    ),
                  if (!listEquals(otherHymns, hymns))
                    ...otherHymns!.map(
                      (e) => ListTile(
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Text(
                          e!.id,
                          style: TextStyle(
                            fontSize: 16,
                            color: appColors.onPrimary,
                          ),
                        ),
                        title: Text(
                          e.title.toUpperCase(),
                          style: TextStyle(
                            color: appColors.onPrimary,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HymnDetailsPage(hymn: e);
                              },
                            ),
                          );
                        },
                      ),
                    )
                ],
              );
            }
            final hymn = hymns[index];
            return ListTile(
              dense: true,
              horizontalTitleGap: 1,
              leading: Text(
                hymn!.id + (hymn.id.length > 2 ? '  ' : ' '),
                style: TextStyle(
                  fontSize: 16,
                  color: appColors.onPrimary,
                ),
              ),
              title: Text(
                hymn.title.toUpperCase(),
                style: TextStyle(
                  color: appColors.onPrimary,
                  fontSize: 14,
                ),
              ),
              titleAlignment: ListTileTitleAlignment.top,
              minVerticalPadding: 12,
              onTap: () {
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
            );
          },
        ),
      ),
    );
  }
}
