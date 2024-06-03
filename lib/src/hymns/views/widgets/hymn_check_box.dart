import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HymnCheckBox extends StatelessWidget {
  const HymnCheckBox({
    super.key,
    required this.checkboxValue,
    required this.onTapCheckMark,
  });

  final bool checkboxValue;
  final void Function(bool? p1)? onTapCheckMark;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return Checkbox.adaptive(
      value: checkboxValue,
      onChanged: onTapCheckMark,
      // fillColor: MaterialStateProperty.all<Color>(appColors.accent),
      // overlayColor: MaterialStateProperty.all<Color>(appColors.accent),
      checkColor: appColors.onPrimary,
      activeColor: appColors.surface,
      side: BorderSide(
        width: 2,
        color: appColors.onPrimary,
      ),
    );
  }
}
