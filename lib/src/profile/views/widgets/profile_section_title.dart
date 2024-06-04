import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 14, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: appColors.accentSecondary,
        ),
      ),
    );
  }
}
