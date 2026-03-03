import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
