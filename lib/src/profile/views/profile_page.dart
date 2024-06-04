import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;

    return Scaffold(
      backgroundColor: appColors.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 16, color: appColors.onPrimary),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 18, left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 52,
                                  color: appColors.onPrimary.withOpacity(0.8),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mangi Elijah",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "mangielijah@gmail.com",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.logout_rounded,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ProfileDivider(),
                    Padding(
                      padding: const EdgeInsets.only(right: 46.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ProfileSectionTitle(title: "About us"),
                              ProfileListItem(
                                title: "Privacy policy",
                                icon: Icons.policy_outlined,
                                onTap: () {},
                              ),
                              ProfileListItem(
                                title: "Terms and conditions",
                                icon: Icons.gavel_rounded,
                                onTap: () {},
                              ),
                              const SizedBox(height: 18),
                              const ProfileSectionTitle(title: "Others"),
                              ProfileListItem(
                                title: "Share to friends",
                                icon: Icons.share_rounded,
                                onTap: () {},
                              ),
                            ],
                          ),
                          const ProfileDivider(),
                          const PurchaseSection(hasPurchased: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: MediaQuery.sizeOf(context).width - 60,
              child: Container(
                height: MediaQuery.sizeOf(context).height - 140,
                width: 60,
                decoration: BoxDecoration(
                  color: appColors.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
              : TextButton(
                  onPressed: () {},
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
                      "Purchase",
                      style: TextStyle(
                        color: appColors.onPrimary,
                      ),
                    ),
                  ),
                ),
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
