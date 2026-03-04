import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/features/event_details/views/invite_friends_view.dart';
import 'package:event_hub_app/features/event_details/widgets/circle_icon_button.dart';
import 'package:event_hub_app/features/event_details/widgets/going_invite_card.dart';
import 'package:event_hub_app/features/profile/views/organizer_profile_view.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 52),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: AppStyles.titleMediun35),
                        const SizedBox(height: 18),
                        _MetaInfoTile(
                          icon: Icons.calendar_month_rounded,
                          title: event.fullDate,
                          subtitle: event.timeRange,
                        ),
                        const SizedBox(height: 12),
                        _MetaInfoTile(
                          icon: Icons.location_on_rounded,
                          title: event.locationName,
                          subtitle: event.locationAddress,
                        ),
                        const SizedBox(height: 16),
                        _OrganizerTile(event: event),
                        const SizedBox(height: 20),
                        Text(
                          'About Event',
                          style: AppStyles.mainBodyNormal16.copyWith(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          event.aboutDescription,
                          style: AppStyles.comment.copyWith(
                            color: AppColors.subColor,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24, 8, 24, 14),
        child: MainButton(
          text: 'BUY TICKET \$${event.ticketPrice.toStringAsFixed(0)}',
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'event-cover-${event.id}',
              child: Image.asset(event.imageAsset, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.06),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 44, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 25,
                      ),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    Text(
                      'Event Details',
                      style: AppStyles.h4.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                CircleIconButton(
                  icon: event.isBookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                ),
              ],
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: -30,
            child: GoingInviteCard(
              event: event,
              onInvitePressed: () => InviteFriendsView.show(context, event),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MetaInfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.smallEditButton,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryBlue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.mainBodyNormal16),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: AppStyles.subTitle1Medium13.copyWith(
                  color: AppColors.subColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OrganizerTile extends StatelessWidget {
  final EventModel event;

  const _OrganizerTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushTo(const OrganizerProfileView());
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.smallEditButton,
            backgroundImage: AssetImage(event.organizerAvatarAsset),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.organizerName, style: AppStyles.mainBodyNormal16),
                const SizedBox(height: 2),
                Text(
                  event.organizerRole,
                  style: AppStyles.subTitle1Medium13.copyWith(
                    color: AppColors.subColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Follow',
              style: AppStyles.subTitle1Medium13.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
