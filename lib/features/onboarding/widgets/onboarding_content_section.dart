import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContentSection extends StatelessWidget {
  final String title;
  final String body;
  final int currentIndex;
  final int totalCount;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingContentSection({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
    required this.totalCount,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          // The decorative top line
          Container(
            height: 10,
            width: double.infinity,
            color: AppColors.white.withValues(alpha: .5),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                topRight: Radius.circular(48),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, textAlign: TextAlign.center, style: AppStyles.h5),
                  const Gap(16),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: AppStyles.body2.copyWith(
                      color: AppColors.white.withValues(alpha: .5),
                    ),
                  ),
                  const Gap(45),
                  _buildNavigationRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: AppStyles.title1Medium18.copyWith(
              color: AppColors.white.withValues(alpha: .5),
            ),
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: totalCount,
        ),
        GestureDetector(
          onTap: onNext,
          child: const Text('Next', style: AppStyles.title1Medium18),
        ),
      ],
    );
  }
}
