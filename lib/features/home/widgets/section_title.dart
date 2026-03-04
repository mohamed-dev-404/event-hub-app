import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionTitle({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.subColor.withValues(alpha: 0.8),
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: AppColors.subColor.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
