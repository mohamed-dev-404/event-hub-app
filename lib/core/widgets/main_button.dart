import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool hasIcon;

  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.hasIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.strokGray),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Text(text.toUpperCase(), style: AppStyles.button),
                  hasIcon
                      ? const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.blueDark,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: AppColors.white,
                          ),
                        )
                      : const SizedBox(width: 30),
                ],
              ),
      ),
    );
  }
}
