import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/favorites/view/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors;
    return SizedBox(
      height: 76,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: appColor.secondary,
              ),
              child: Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: appColor.accentSecondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      final snackBar = SnackBar(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: appColor.background,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Categories are coming soon, here you explore other hymns like Presbyterian, Baptist and many more',
                          style: TextStyle(color: appColor.primary),
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.widgets_outlined,
                      size: 18,
                      color: appColor.accent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FavoritesPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: appColor.accentSecondary,
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 20,
                      color: appColor.onAccentSecondary,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      final snackBar = SnackBar(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: appColor.background,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Profile management is coming soon, excited about this',
                          style: TextStyle(color: appColor.primary),
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: appColor.accentSecondary,
                      foregroundColor: appColor.accentSecondary,
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: 20,
                      color: appColor.onAccentSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
