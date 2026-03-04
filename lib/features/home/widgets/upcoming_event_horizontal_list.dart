import 'package:event_hub_app/features/home/data/data_source/home_mockups.dart';
import 'package:event_hub_app/features/home/widgets/upcoming_event_card.dart';
import 'package:flutter/material.dart';

class UpcomingEventsHorizontalList extends StatelessWidget {
  const UpcomingEventsHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // Height to accommodate card + shadow
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemCount: HomeMockData.upcomingEvents.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final event = HomeMockData.upcomingEvents[index];
          return UpcomingEventCard(event: event);
        },
      ),
    );
  }
}
