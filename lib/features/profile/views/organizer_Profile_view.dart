import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/profile/models/organizer_event_model.dart';
import 'package:event_hub_app/features/profile/models/organizer_review_model.dart';
import 'package:event_hub_app/features/profile/widgets/about_me.dart';
import 'package:event_hub_app/features/profile/widgets/editbutton.dart';
import 'package:event_hub_app/features/profile/widgets/organizer_event_card.dart';
import 'package:event_hub_app/features/profile/widgets/organizer_review_tile.dart';
import 'package:event_hub_app/features/profile/widgets/topscreen.dart';
import 'package:flutter/material.dart';

class OrganizerProfileView extends StatelessWidget {
  const OrganizerProfileView({super.key});

  static const List<OrganizerEventModel> events = [
    OrganizerEventModel(
      dayAndTime: '1ST MAY - SAT - 2:00 PM',
      title: 'A virtual evening of smooth jazz',
      subtitle: 'Broklin, New York',
      imagePath: AppImages.assetsImagesSmallTest1,
      imageBackgroundColor: AppColors.bluePurple,
    ),
    OrganizerEventModel(
      dayAndTime: '10TH JUNE - MON - 6:30 PM',
      title: "Jo malone london's mother's day",
      subtitle: 'London, UK',
      imagePath: AppImages.assetsImagesSmallTest2,
      imageBackgroundColor: AppColors.red,
    ),
    OrganizerEventModel(
      dayAndTime: '5TH JULY - FRI - 1:00 PM',
      title: "Women's leadership conference",
      subtitle: 'Toronto, Canada',
      imagePath: AppImages.assetsImagesSmallTest3,
      imageBackgroundColor: AppColors.deepPurple,
    ),
  ];

  static const List<OrganizerReviewModel> reviews = [
    OrganizerReviewModel(
      userName: 'Rocks Velineijen',
      date: '10 Feb',
      rating: 4.5,
      comment:
          'Cinemas is the ultimate experience to see new movies in Gold Class '
          'or Vmax. Find a cinema near you.',
    ),
    OrganizerReviewModel(
      userName: 'Angelina Zolly',
      date: '10 Feb',
      rating: 4.0,
      comment:
          'Cinemas is the ultimate experience to see new movies in Gold Class '
          'or Vmax. Find a cinema near you.',
    ),
    OrganizerReviewModel(
      userName: 'Zenifero Bolex',
      date: '10 Feb',
      rating: 5.0,
      comment:
          'Cinemas is the ultimate experience to see new movies in Gold Class '
          'or Vmax. Find a cinema near you.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(29),
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopScreen(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EditProfileButton(
                      text: 'Follow',

                      isFilled: true,
                      path: AppIcons.assetsIconsAddUser,
                    ),

                    EditProfileButton(
                      text: 'Messages',

                      isFilled: false,
                      path: AppIcons.assetsIconsMessage,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TabBar(
                  dividerColor: Colors.transparent,

                  overlayColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: AppColors.primaryBlue,
                      width: 2,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 24),
                  ),
                  labelColor: AppColors.primaryBlue,
                  unselectedLabelColor: AppColors.haifGray,
                  labelStyle: AppStyles.graph.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: AppStyles.subTitle1Medium13,
                  tabs: const [
                    Tab(text: 'ABOUT'),
                    Tab(text: 'EVENT'),
                    Tab(text: 'REVIEWS'),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      const AboutMeSection(),
                      ListView.separated(
                        itemCount: events.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            OrganizerEventCard(event: events[index]),
                      ),
                      ListView.separated(
                        itemCount: reviews.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 16),
                        itemBuilder: (context, index) =>
                            OrganizerReviewTile(review: reviews[index]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
