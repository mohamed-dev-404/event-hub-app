import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';

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
        children: const [
          EventItem(
            imagePath: AppImages.assetsImagesHomeTest1,
            title: 'Jo Malone London’s Mother’s Day Presents',
            date: 'Wed, Apr 28 • 5:30 PM',
            location: 'Radius Gallery • Santa Cruz, CA',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest3,
            title: 'A Virtual Evening of Smooth Jazz',
            date: 'Sat, May 1 • 2:00 PM',
            location: 'Lot 13 • Oakland, CA',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest4,
            title: "Women's Leadership Conference 2021",
            date: 'Sat, Apr 24 • 1:30 PM',
            location: '53 Bush St • San Francisco, CA',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest2,
            title: 'International Kids Safe Parents Night Out',
            date: 'Fri, Apr 23 • 6:00 PM',
            location: 'Lot 13 • Oakland, CA',
          ),
          EventItem(
            imagePath: AppImages.homeTest0,
            title: 'Collectivity Plays the Music of Jimi',
            date: 'Mon, Jun 21 • 10:00 PM',
            location: 'Longboard Margarita Bar',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest1,
            title: 'International Gala Music Festival',
            date: 'Sun, Apr 25 • 10:15 AM',
            location: '36 Guild Street London, UK',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesHomeTest1,
            title: 'Jo Malone London’s Mother’s Day Presents',
            date: 'Wed, Apr 28 • 5:30 PM',
            location: 'Radius Gallery • Santa Cruz, CA',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest3,
            title: 'A Virtual Evening of Smooth Jazz',
            date: 'Sat, May 1 • 2:00 PM',
            location: 'Lot 13 • Oakland, CA',
          ),
          EventItem(
            imagePath: AppImages.assetsImagesSmallTest4,
            title: "Women's Leadership Conference 2021",
            date: 'Sat, Apr 24 • 1:30 PM',
            location: '53 Bush St • San Francisco, CA',
          ),
        ],
      ),
    );
  }
}
