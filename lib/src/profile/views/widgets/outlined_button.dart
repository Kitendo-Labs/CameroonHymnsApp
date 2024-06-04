import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileOutlinedButton extends StatelessWidget {
  const ProfileOutlinedButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: appColors.accentSecondary,
            width: 2,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 62,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: appColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
