import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/home/data/data_source/home_mockups.dart';
import 'package:event_hub_app/features/events/widgets/event_item.dart';
import 'package:flutter/material.dart';

class SeeAllEvents extends StatelessWidget {
  const SeeAllEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Events',
          style: AppStyles.h1,
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...HomeMockData.upcomingEvents,
          ...HomeMockData.nearbyEvents,
        ].map((event) => EventItem(event: event)).toList(),
      ),
    );
  }
}
