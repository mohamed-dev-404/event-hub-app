import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class ThirdAuthButton extends StatelessWidget {
  const ThirdAuthButton({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgPicture(path: image),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: AppStyles.button.copyWith(
              color: AppColors.title,
            ),
          ),
        ],
      ),
    );
  }
}
