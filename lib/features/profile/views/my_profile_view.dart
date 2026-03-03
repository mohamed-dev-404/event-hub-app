import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/profile/models/interst_model.dart';
import 'package:event_hub_app/features/profile/widgets/about_me.dart';
import 'package:event_hub_app/features/profile/widgets/editbutton.dart';
import 'package:event_hub_app/features/profile/widgets/interest.dart';
import 'package:event_hub_app/features/profile/widgets/samlleditbutton.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  static const List<InterestModel> interests = [
    InterestModel(title: 'Games Online', color: AppColors.bluePurple),
    InterestModel(title: 'Concert', color: AppColors.red),
    InterestModel(title: 'Music', color: AppColors.orange),
    InterestModel(title: 'Art', color: AppColors.deepPurple),
    InterestModel(title: 'Movie', color: AppColors.green),
    InterestModel(title: 'Others', color: AppColors.babyBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        titleSpacing: 0,
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Profile Image
              ClipOval(
                child: Image.asset(
                  AppImages.profile,
                  width: 124,
                  height: 124,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Ashfak Sayem',
                style: AppStyles.h4,
              ),

              const SizedBox(height: 10),

              /// Followers Section
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text('350', style: AppStyles.mainBodyNormal16),
                        SizedBox(height: 6),
                        Text('Following', style: AppStyles.body3),
                      ],
                    ),

                    const SizedBox(width: 23),

                    VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),

                    const SizedBox(width: 23),

                    const Column(
                      children: [
                        Text('346', style: AppStyles.mainBodyNormal16),
                        SizedBox(height: 6),
                        Text('Followers', style: AppStyles.body3),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 21),

              const EditProfileButton(),

              const SizedBox(height: 25),

              const AboutMeSection(),

              const SizedBox(height: 20),

             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('Interest', style: AppStyles.title1Medium18),
                  SmallButton(text: 'Change',)
                ],
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: interests
                    .map((interest) => InterestChip(interest: interest))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}