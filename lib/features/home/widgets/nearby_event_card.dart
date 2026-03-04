import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/event_details/views/event_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearbyEventCard extends StatelessWidget {
  final EventModel event;
  const NearbyEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTo(EventDetailsView(event: event));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                //* Event Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    event.imageAsset,
                    width: 80,
                    height: 92,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                // Event Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.listDateString.toUpperCase(),
                        style: AppStyles.subTitle2.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.mainBodyNormal16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.assetsIconsLocationOutline,
                            colorFilter: const ColorFilter.mode(
                              AppColors.haifGray,
                              BlendMode.srcIn,
                            ),
                            width: 14,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '${event.locationName} • ${event.locationAddress}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.subTitle1Medium13.copyWith(
                                color: AppColors.haifGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25), // Space for bookmark
              ],
            ),
            // Bookmark Icon
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                event.isBookmarked
                    ? AppIcons.assetsIconsBookmarkSolid
                    : AppIcons.assetsIconsBookmarkOutline,
                colorFilter: const ColorFilter.mode(
                  AppColors.red,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
