import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Text(
          'About Me',
          style: AppStyles.graphtitle,
        ),

        const SizedBox(height: 10),

        ReadMoreText(
          'Enjoy your favorite dishe and a lovely your friends and family '
          'and have a great time. Food from local food trucks will be '
          'available for purchase.',

          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More ▼',
          trimExpandedText: 'Read Less ▲',

          style: AppStyles.graph,

          moreStyle: AppStyles.graph.copyWith(
            color: AppColors.primaryBlue,
          ),

          lessStyle: AppStyles.title2.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }
}