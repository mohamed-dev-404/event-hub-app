import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';

class EditProfileButton extends StatelessWidget {
  final String text;
  final String path;
  final bool isFilled;
  final VoidCallback? onTap;

  const EditProfileButton({
    super.key,
    required this.text,
    required this.path,
    this.isFilled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color contentColor = isFilled
        ? AppColors.white
        : AppColors.primaryBlue;
    final Color backgroundColor = isFilled
        ? AppColors.primaryBlue
        : Colors.transparent;

    return SizedBox(
      width: 154,
      height: 50,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.primaryBlue,
            width: 1.5,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(
                path: path,
                width: 22,
                height: 22,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: AppStyles.button.copyWith(
                  color: contentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
