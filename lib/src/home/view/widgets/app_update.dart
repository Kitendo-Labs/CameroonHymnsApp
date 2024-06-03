import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdate extends ConsumerStatefulWidget {
  const AppUpdate({super.key});
  @override
  ConsumerState<AppUpdate> createState() => _ExpandBodyState();
}

class _ExpandBodyState extends ConsumerState<AppUpdate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    return Padding(
      padding: const EdgeInsets.only(top: 32) +
          const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'New Update is available',
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
                  ? Image.asset("assets/images/update_light.png")
                  : Image.asset("assets/images/update_dark.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 2),
            child: Text(
              "It seems you're using an older version of the hymns app, Update for the newest features and experienc",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: appColor.onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final uri = Uri.parse(
                "https://play.google.com/store/apps/details?id=io.laureal.medline",
              );
              await launchUrl(uri, mode: LaunchMode.externalApplication);
              ref.invalidate(appStartupProvider);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              backgroundColor: appColor.accent,
              foregroundColor: AppColors.black,
              elevation: 2,
            ),
            child: const Text(
              'GET UPDATES NOW',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

void showAppUpdate(AppColorsExtension appColor, BuildContext context) {
  showModalBottomSheet(
    context: context,
    enableDrag: false,
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
      return SizedBox(
        height: MediaQuery.sizeOf(context).height / 2,
        child: const AppUpdate(),
      );
    },
  );
}
