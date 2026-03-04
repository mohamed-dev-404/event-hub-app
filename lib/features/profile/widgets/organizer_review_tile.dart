import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/profile/models/organizer_review_model.dart';
import 'package:flutter/material.dart';

class OrganizerReviewTile extends StatelessWidget {
  final OrganizerReviewModel review;

  const OrganizerReviewTile({
    super.key,
    required this.review,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.smallEditButton,
          backgroundImage: AssetImage(AppImages.profile),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      review.userName,
                      style: AppStyles.mainBodyNormal16.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    review.date,
                    style: AppStyles.subTitle1Medium13.copyWith(
                      fontSize: 13,
                      color: AppColors.haifGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (int i = 0; i < 4; i++) ...[
                    const Icon(
                      Icons.star_rate_rounded,
                      size: 22,
                      color: Color(0xFFF4B740),
                    ),
                    const SizedBox(width: 4),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              Text(review.comment, style: AppStyles.comment),
            ],
          ),
        ),
      ],
    );
  }
}
