import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/features/events/views/see_all_events.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.strokGray,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'UPCOMING',
                          style: AppStyles.subTitle2,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(
                        child: Text(
                          'PAST EVENTS',
                          style: AppStyles.title2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 98),
            Image.asset(
              AppImages.assetsImagesCalendar,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 31),
            const Text('NO Upcomping Event', style: AppStyles.graphtitle),
            const SizedBox(height: 13),
            const Text(
              'Lorm ipsum dolor sit amet, \n           consectetur',
              style: AppStyles.title2,
            ),
            const Spacer(),
            MainButton(
              text: 'EXPLORE EVENTS',
              onPressed: () {
                context.pushTo(const SeeAllEvents());
              },
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
