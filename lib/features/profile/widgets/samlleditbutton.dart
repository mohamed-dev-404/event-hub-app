import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';

class SmallButton extends StatelessWidget {
  final String text;

  const SmallButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.smallEditButton,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomSvgPicture(
              path: 'assets/icons/edit.svg',
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 8),
            Text(
              text.toUpperCase(),
              style: AppStyles.title1Medium18.copyWith(
                fontSize: 14,
                color: AppColors.primaryBlue,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
