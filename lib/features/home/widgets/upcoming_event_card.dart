import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/features/event_details/views/event_details_view.dart';
import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  final EventModel event;
  const UpcomingEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTo(EventDetailsView(event: event));
      },
      child: Container(
        width: 235,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Image + Date + Bookmark
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    event.imageAsset,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Date Ribbon
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: .7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      event.shortDate,
                      textAlign: TextAlign.center,
                      style: AppStyles.mainBodyNormal16.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
                // Bookmark Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: CustomSvgPicture(
                      path: event.isBookmarked
                          ? AppIcons.assetsIconsBookmarkSolid
                          : AppIcons.assetsIconsBookmarkOutline,
                      color: AppColors.red,
                      height: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            //* Event Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                event.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.mainBodyNormal16.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            //* Attendees & Date Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  _buildAttendeeAvatars(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '+${event.goingCount} Going',
                      style: AppStyles.subTitle2.copyWith(
                        color: AppColors.blueDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //* Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  const CustomSvgPicture(
                    path: AppIcons.assetsIconsLocationSolid,
                    color: AppColors.haifGray,
                    height: 14,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      event.locationAddress,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.body3,
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

  Widget _buildAttendeeAvatars() {
    if (event.attendeeImages.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 24,
      width: 45,
      child: Stack(
        children: List.generate(
          event.attendeeImages.length > 3 ? 3 : event.attendeeImages.length,
          (index) => Positioned(
            left: index * 12.0, // Overlap by 12 pixels
            child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.white,
              child: CircleAvatar(
                radius: 11,
                backgroundImage: AssetImage(event.attendeeImages[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
