import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/hymns/models/hymns.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/close_button.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/font_slider.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/hymn_body_header.dart';
import 'package:cameroon_hymn/src/hymns/views/widgets/play_button.dart';
import 'package:cameroon_hymn/src/utils/extentions.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

final showSlider = StateProvider((ref) => false);

class HymnDetailsPage extends ConsumerWidget {
  const HymnDetailsPage({super.key, required this.hymn});

  final Hymn hymn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    return Scaffold(
      backgroundColor: appColors.primary,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            margin: EdgeInsets.only(
              right: 30,
              bottom: ref.watch(homeBottomSize),
            ),
            padding: const EdgeInsets.only(
              bottom: 40,
              top: 60,
              right: 50,
              left: 30,
            ),
            decoration: BoxDecoration(
              color: appColors.secondary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(90),
              ),
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: Text(
                        hymn.title.toLowerCase().capitalize(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: appColors.accentSecondary,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GlowingOverscrollIndicator(
                        color: appColors.accent,
                        axisDirection: AxisDirection.down,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              if (hymn.antiphones.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: hymn.antiphones
                                        .map(
                                          (e) => AnimatedDefaultTextStyle(
                                            duration: Duration(
                                                milliseconds: ref.watch(
                                                    textAnimationDuration)),
                                            curve: ref.watch(textCurve),
                                            style: TextStyle(
                                              color: appColors.onPrimary,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w600,
                                              height: 1.50,
                                              fontSize: 14 *
                                                  (ref.watch(
                                                          fontSizeMultiplierProvider) -
                                                      0.05),
                                            ),
                                            child: Text(
                                              "Antiphone ${hymn.antiphones.indexOf(e) + 1} \n$e \n",
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              if (hymn.refrains.isNotEmpty)
                                SpecialVerseTextWidget(
                                  hymns: hymn.refrains,
                                  title: "Refrain",
                                ),
                              if (hymn.chorus.isNotEmpty)
                                SpecialVerseTextWidget(
                                  hymns: hymn.chorus,
                                  title: "Chorus",
                                ),
                              if (hymn.verses.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: hymn.verses
                                      .map(
                                        (e) => AnimatedDefaultTextStyle(
                                          duration: Duration(
                                              milliseconds: ref.watch(
                                                  textAnimationDuration)),
                                          curve: ref.watch(textCurve),
                                          style: TextStyle(
                                            color: appColors.onPrimary,
                                            fontSize: 14 *
                                                ref.watch(
                                                    fontSizeMultiplierProvider),
                                            height: 1.50,
                                          ),
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ref.watch(appPaddingProvider).top,
            ),
            child: HymnsBodyHeader(hymn: hymn),
          ),
          if (ref.watch(showPlayer))
            Positioned(
              bottom: ref.watch(appPaddingProvider).bottom,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: expanded,
                width: MediaQuery.sizeOf(context).width - 58,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                  onTap: () {
                    ref.watch(showMore.notifier).update((state) => !state);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 7,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 8.0,
                            ),
                            tickMarkShape: const RoundSliderTickMarkShape(
                              tickMarkRadius: 0.0,
                            ),
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: 0.2,
                            max: 1,
                            min: 0,
                            thumbColor: appColors.accent,
                            activeColor: appColors.accent,
                            secondaryActiveColor: appColors.accent,
                            inactiveColor: appColors.onAccentSecondary,
                            onChanged: (double value) {},
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("00:56"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (!ref.watch(showPlayer))
            Positioned(
              bottom: ref.watch(appPaddingProvider).bottom,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: ref.watch(showMore) ? expanded : dense,
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                onEnd: () {
                  ref.watch(showSlider.notifier).update((state) {
                    return ref.watch(showMore);
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    ref.watch(showMore.notifier).update((state) => !state);
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: ref.watch(showMore)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appColors.accentSecondary,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: appColors.accentSecondary),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        size: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text("Close"),
                                  ],
                                ),
                              ),
                              if (ref.watch(showSlider)) const FontSlider(),
                            ],
                          )
                        : Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/chevron_double_up.svg",
                                  colorFilter: ColorFilter.mode(
                                    appColors.onPrimary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const Text("Change Hymn Text Size"),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ),
          HymnCloseButton(appColors: appColors),
          PlayButton(appColors: appColors)
        ],
      ),
    );
  }
}

class SpecialVerseTextWidget extends ConsumerWidget {
  const SpecialVerseTextWidget({
    super.key,
    required this.hymns,
    required this.title,
  });

  final List<String> hymns;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: hymns
            .map(
              (hymn) => AnimatedDefaultTextStyle(
                duration:
                    Duration(milliseconds: ref.watch(textAnimationDuration)),
                curve: ref.watch(textCurve),
                style: TextStyle(
                  color: appColors.onPrimary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                  fontSize: 14 * (ref.watch(fontSizeMultiplierProvider) - 0.05),
                ),
                child: Text(
                  specialVerseBodyFormatted(
                    hymns,
                    hymn,
                    title,
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: appColors.onPrimary,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                    fontSize:
                        14 * (ref.watch(fontSizeMultiplierProvider) - 0.05),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

String specialVerseBodyFormatted(
    List<String> hymns, String section, String title) {
  return hymns.indexOf(section) == 0
      ? "$title:\n$section"
      : hymns.indexOf(section) == hymns.length - 1
          ? "$section\n"
          : section;
}
