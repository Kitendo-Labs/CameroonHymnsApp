import 'package:cameroon_hymn/src/profile/views/widgets/outlined_button.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PurchaseSection extends StatelessWidget {
  const PurchaseSection({
    super.key,
    required this.hasPurchased,
  });
  final bool hasPurchased;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          hasPurchased
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 62,
                  ),
                  child: Text(
                    "THANK YOU",
                    style: TextStyle(color: appColors.accentSecondary),
                  ),
                )
              : ProfileOutlinedButton(title: "Purchase", onPressed: () {}),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              hasPurchased
                  ? "Thank you for your trust and belief in our mission. Your support is  instrumental in helping us continue to enhance and expand Cameroon Hymns  for everyone."
                  : "By Supporting with 1000Frs yearly, you're not just gaining access to exclusive features, you're investing in the future of Cameroon Hymns.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
