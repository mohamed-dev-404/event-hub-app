import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class NotificationViewEmpty extends StatelessWidget {
  const NotificationViewEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Notifications'),
        titleSpacing: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.assetsImagesNotification),
              const Gap(30),
              Text(
                'No Notifications!',
                style: AppStyles.h1.copyWith(color: AppColors.notification),
              ),
              const Gap(10),
              Text(
                'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit sed do eiusmod ',
                textAlign: TextAlign.center,

                style: AppStyles.title2.copyWith(color: AppColors.notification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
