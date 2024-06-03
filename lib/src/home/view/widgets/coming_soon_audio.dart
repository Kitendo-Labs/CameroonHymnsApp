import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComingSoonWidget extends ConsumerStatefulWidget {
  const ComingSoonWidget({super.key});
  @override
  ConsumerState<ComingSoonWidget> createState() => _ExpandBodyState();
}

class _ExpandBodyState extends ConsumerState<ComingSoonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Audio hymns coming very soon',
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                color: appColor.accentSecondary,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: appColor.primary),
            ),
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Theme.of(context).brightness == Brightness.light
                  ? Image.asset("assets/images/coming_audio_light.png")
                  : Image.asset("assets/images/coming_audio_dark.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 2),
            child: Text(
              'Experience hymns the way that suits you best – listen for peaceful reflection, sing along, or do both!',
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: appColor.onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Audio hymns coming very soon.',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: appColor.onPrimary,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

void showAudioComingSoon(AppColorsExtension appColor, BuildContext context) {
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
    showDragHandle: true,
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
                const Positioned.fill(
                  child: ComingSoonWidget(),
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
}
