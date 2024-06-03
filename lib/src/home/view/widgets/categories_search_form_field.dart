import 'dart:io';

import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextFormFieldOutline extends StatefulWidget {
  const SearchTextFormFieldOutline({
    super.key,
    this.hintText = "Search categories",
    this.shouldClear = false,
    this.onChanged,
    this.onClear,
  });

  final String hintText;
  final Function(String)? onChanged;
  final Function()? onClear;
  final bool shouldClear;

  @override
  State<SearchTextFormFieldOutline> createState() =>
      _SearchTextFormFieldOutlineState();
}

class _SearchTextFormFieldOutlineState
    extends State<SearchTextFormFieldOutline> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors;
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      cursorColor: appColor.accentSecondary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(
          (14),
          (10),
          (12),
          (9),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: appColor.background.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: appColor.background.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: appColor.background.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        prefixIcon: Icon(
          Platform.isIOS ? CupertinoIcons.search : Icons.search,
          color: appColor.background,
        ),
        suffixIcon: widget.shouldClear
            ? GestureDetector(
                onTap: () {
                  widget.onClear;
                  controller.clear();
                },
                child: Icon(
                  Icons.close,
                  color: appColor.background,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: appColor.background,
          fontWeight: FontWeight.w400,
          fontFamily: 'Muli',
          fontSize: (14),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
