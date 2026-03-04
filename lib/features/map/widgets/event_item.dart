import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MapEventItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String location;
  final VoidCallback? onTap;

  const MapEventItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 200,
        width: 250,
        padding: const EdgeInsets.all(10),
       margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: AppStyles.subTitle2,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      style: AppStyles.comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: AppColors.haifGray,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            location,
                            style: AppStyles.title2.copyWith(fontSize: 12)  ,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}