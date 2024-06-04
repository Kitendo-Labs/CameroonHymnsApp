import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      splashColor: appColors.onAccentSecondary,
      leading: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: appColors.secondary,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(2),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: appColors.onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: appColors.onPrimary,
        size: 18,
      ),
    );
  }
}
