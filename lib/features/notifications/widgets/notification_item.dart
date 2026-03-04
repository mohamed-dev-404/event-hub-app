import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/notifications/models/notification_model.dart';
import 'package:event_hub_app/features/notifications/widgets/accept_reject_button.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel model;

  const NotificationItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(model.image),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: model.name,
                        style: AppStyles.h1,
                      ),
                      TextSpan(
                        text: ' ${model.message}',
                        style: AppStyles.body3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                if (model.button)
                  const Row(
                    children: [
                      NotificationActionButton(
                        text: 'Reject',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.notification,
                        borderColor: AppColors.strokGray,
                      ),
                      SizedBox(width: 12),
                      NotificationActionButton(
                        text: 'Accept',
                        backgroundColor: AppColors.primaryBlue,
                        textColor: AppColors.white,
                      ),
                    ],
                  ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            model.time,
            style: AppStyles.subTitle1Medium13,
          ),
        ],
      ),
    );
  }
}
