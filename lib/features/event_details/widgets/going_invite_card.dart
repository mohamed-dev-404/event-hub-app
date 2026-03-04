import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/rounded_text_button.dart';
import 'package:flutter/material.dart';

class GoingInviteCard extends StatelessWidget {
  final EventModel event;

  const GoingInviteCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final attendees = event.attendeeImages.isEmpty
        ? [AppImages.profile, AppImages.profile, AppImages.profile]
        : event.attendeeImages;
    final visibleAttendees = attendees.take(3).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 76,
            height: 36,
            child: Stack(
              clipBehavior: Clip.none,
              children: List.generate(visibleAttendees.length, (index) {
                return Positioned(
                  left: index * 22.0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(visibleAttendees[index]),
                    backgroundColor: AppColors.offWhite,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '+${event.goingCount} Going',
            style: AppStyles.mainBodyNormal16.copyWith(
              color: AppColors.paragraph,
            ),
          ),
          const Spacer(),
          RoundedTextButton(
            label: 'Invite',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
