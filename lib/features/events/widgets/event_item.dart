import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/event_details/views/event_details_view.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const EventItem({
    super.key,
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!.call();
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsView(event: event),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'event-cover-${event.id}',
              child: Image.asset(
                event.imageAsset,
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.listDateString, style: AppStyles.subTitle2),
                  const SizedBox(height: 4),
                  Text(event.title, style: AppStyles.comment),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.haifGray,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${event.locationName} • ${event.locationAddress}',
                          style: AppStyles.title2,
                        ),
                      ),
                    ],
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
