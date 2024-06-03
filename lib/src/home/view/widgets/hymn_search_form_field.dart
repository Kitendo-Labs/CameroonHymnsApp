
import 'package:cameroon_hymn/src/hymns/services/hymns_services.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchedTermFormField extends ConsumerStatefulWidget {
  const SearchedTermFormField({
    super.key,
    required this.searchNode,
  });

  final FocusNode searchNode;

  @override
  ConsumerState<SearchedTermFormField> createState() =>
      _SearchedTermFormFieldState();
}

class _SearchedTermFormFieldState extends ConsumerState<SearchedTermFormField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: ref.read(searchedTermProvider));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return TextFormField(
      controller: _controller,
      focusNode: widget.searchNode,
      cursorColor: appColors.onPrimary,
      decoration: InputDecoration(
        suffixIcon: ref.watch(searchedTermProvider).isNotEmpty
            ? GestureDetector(
                onTap: () {
                  ref
                      .watch(searchedTermProvider.notifier)
                      .update((state) => '');
                  _controller.clear();
                },
                child: Icon(
                  Icons.close,
                  color: appColors.background,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.only(left: 40, top: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (value) {
        ref.watch(searchedTermProvider.notifier).update((state) => value);
      },
    );
  }
}
