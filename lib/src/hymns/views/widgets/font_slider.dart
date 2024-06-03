import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FontSlider extends ConsumerWidget {
  const FontSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = Theme.of(context).appColors;
    return AnimatedOpacity(
      opacity: ref.watch(showMore) ? 1 : 1,
      duration: const Duration(milliseconds: 900),
      curve: ref.watch(showMore) ? Curves.elasticIn : Curves.elasticOut,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1x",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "1.25x",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "1.50x",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "1.75x",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "2x",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
              tickMarkShape:
                  const RoundSliderTickMarkShape(tickMarkRadius: 4.0),
            ),
            child: SizedBox(
              height: 30,
              child: Slider(
                value: ref.watch(fontSizeMultiplierProvider),
                max: 2,
                min: 1,
                divisions: 4,
                label: ref.watch(fontSizeMultiplierProvider).toString(),
                thumbColor: appColors.accentSecondary,
                activeColor: appColors.accentSecondary,
                secondaryActiveColor: appColors.accent,
                inactiveColor: appColors.accent,
                onChanged:
                    ref.watch(fontSizeMultiplierProvider.notifier).update,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
