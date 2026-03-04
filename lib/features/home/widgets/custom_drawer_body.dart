import 'package:event_hub_app/core/functions/coming_soon_dialog.dart';
import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/notifications/views/notification_view.dart';
import 'package:event_hub_app/features/profile/views/my_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 25,
        bottom: 6,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! --- 1. PROFILE SECTION ---
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(AppImages.profile),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ashfak Sayem',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
          ),

          const SizedBox(height: 10),

          //! --- 2. MENU ITEMS ---
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _DrawerItem(
                    title: 'My Profile',
                    iconAsset: AppIcons.assetsIconsPersonOutline,
                    onTap: () {
                      context.pushTo(const MyProfileView());
                    },
                  ),
                  _DrawerItem(
                    title: 'Message',
                    iconAsset: AppIcons.assetsIconsMessage,
                    onTap: () {
                      context.pushTo(NotificationView());
                    },
                    // The orange badge for messages
                    trailing: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _DrawerItem(
                    title: 'Calendar',
                    iconAsset: AppIcons.assetsIconsCalendarOutline,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                  _DrawerItem(
                    title: 'Bookmark',
                    iconAsset: AppIcons.assetsIconsBookmarkOutline,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                  _DrawerItem(
                    title: 'Contact Us',
                    iconAsset: AppIcons.assetsIconsMail,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                  _DrawerItem(
                    title: 'Settings',
                    iconAsset: AppIcons.assetsIconsSettings,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                  _DrawerItem(
                    title: 'Helps & FAQs',
                    iconAsset: AppIcons.assetsIconsInfo,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                  _DrawerItem(
                    title: 'Sign Out',
                    iconAsset: AppIcons.assetsIconsLogInOutline,
                    onTap: () {
                      comingSoonDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          //! --- 3. UPGRADE PRO BUTTON ---
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              comingSoonDialog(context);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryCyanSecondary.withValues(
                  alpha: .15,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.assetsIconsPremium,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryCyanSecondary,
                      BlendMode.srcIn,
                    ),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Upgrade Pro',
                    style: AppStyles.body2.copyWith(
                      color: AppColors.primaryCyanSecondary,
                      fontWeight: FontWeight.w600,
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

class _DrawerItem extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback onTap;
  final Widget? trailing;

  const _DrawerItem({
    required this.title,
    required this.iconAsset,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(
              iconAsset,
              height: 22,
              width: 22,
              colorFilter: const ColorFilter.mode(
                AppColors.subColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 16),

            // Text
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.paragraph, // Dark gray for text
              ),
            ),

            // Spacer pushes trailing widget to the right
            if (trailing != null) ...[
              const Spacer(),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
