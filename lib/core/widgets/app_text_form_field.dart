import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool enabled;
  final bool obscureText;
  final int maxLines;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: maxLines,
      style: AppStyles.mainBodyNormal16.copyWith(
        color: AppColors.subColor,
        fontFamily: AppFonts.airbnbCereal,
      ), // User typing style
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
