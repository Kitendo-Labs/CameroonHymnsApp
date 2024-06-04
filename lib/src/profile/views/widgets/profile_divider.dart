import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Divider(
        color: appColors.onPrimary.withOpacity(0.2),
      ),
    );
  }
}
