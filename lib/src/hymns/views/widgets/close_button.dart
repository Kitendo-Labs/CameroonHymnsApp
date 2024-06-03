
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HymnCloseButton extends ConsumerWidget {
  const HymnCloseButton({
    super.key,
    required this.appColors,
  });

  final AppColorsExtension appColors;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 450),
      bottom: ref.watch(homeBottomSize),
      right: 14,
      child: GestureDetector(
        onTap: () {
          ref.watch(showPlayer.notifier).update((state) => false);
        },
        child: SizedBox(
          height: 40,
          width: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.close,
              size: 30,
              color: appColors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
