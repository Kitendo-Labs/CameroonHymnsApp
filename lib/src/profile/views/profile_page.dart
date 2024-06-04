import 'package:cameroon_hymn/src/profile/views/widgets/outlined_button.dart';
import 'package:cameroon_hymn/src/profile/views/widgets/profile_divider.dart';
import 'package:cameroon_hymn/src/profile/views/widgets/profile_list_item.dart';
import 'package:cameroon_hymn/src/profile/views/widgets/profile_section_title.dart';
import 'package:cameroon_hymn/src/profile/views/widgets/purchase_section.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

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
    bool hasLogin = false;

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
                      child: hasLogin
                          ? Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle_outlined,
                                        size: 52,
                                        color: appColors.onPrimary
                                            .withOpacity(0.8),
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
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_off_outlined,
                                        size: 52,
                                        color: appColors.onPrimary
                                            .withOpacity(0.8),
                                      ),
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Text(
                                          "Not Logged in",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.login_rounded,
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
                                onTap: () {
                                  final url = Uri.parse(
                                      "https://cameroonhymns.kitendo.net/privacy.html#");
                                  launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                              ),
                              ProfileListItem(
                                title: "Terms and conditions",
                                icon: Icons.gavel_rounded,
                                onTap: () {
                                  final url = Uri.parse(
                                      "https://cameroonhymns.kitendo.net/terms.html#");
                                  launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
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
                          hasLogin
                              ? const PurchaseSection(hasPurchased: true)
                              : Align(
                                  alignment: Alignment.center,
                                  child: ProfileOutlinedButton(
                                    title: "Login",
                                    onPressed: () {},
                                  ),
                                ),
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
