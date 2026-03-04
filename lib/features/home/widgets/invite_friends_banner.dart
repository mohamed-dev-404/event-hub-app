import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';

class InviteFriendsBanner extends StatelessWidget {
  const InviteFriendsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        height: 140, // Fixed height to match design proportions
        decoration: BoxDecoration(
          color: AppColors.primaryCyanSecondary.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none, // Allows the image to overflow if needed
          children: [
            // Background Image / Illustration
            Positioned.fill(
              right: -55,
              bottom: -25,
              top: 0,
              child: Image.asset(
                AppImages.assetsImagesGift,
                fit: BoxFit.cover,
              ),
            ),

            // Text Content
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Invite your friends',
                    style: AppStyles.h1.copyWith(
                      color: AppColors.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Get \$20 for ticket',
                    style: AppStyles.subTitle1Medium13,
                  ),
                  const SizedBox(height: 12),

                  // Invite Button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryCyanSecondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'INVITE',
                      style: AppStyles.subTitle1.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
