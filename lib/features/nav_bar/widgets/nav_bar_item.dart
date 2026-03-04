import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? AppColors.primaryBlue
        : AppColors.navBarGray;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSvgPicture(
            path: icon,
            color: color,
            height: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppStyles.subTitle1.copyWith(
              color: isSelected ? AppColors.primaryBlue : AppColors.navBarGray,
            ),
          ),
        ],
      ),
    );
  }
}
