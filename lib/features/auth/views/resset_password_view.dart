import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/app_text_form_field.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/features/auth/views/verification_view.dart';
import 'package:flutter/material.dart';

class RessetPasswordView extends StatelessWidget {
  const RessetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.assetsImagesSplashBg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.title,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Resst Password',
                      style: AppStyles.h4,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'please enter your email address  to request a password reset',
                    style: AppStyles.body3.copyWith(
                      color: AppColors.title,
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const AppTextFormField(
                    hintText: 'hebamaged@gmail.com',
                    prefixIcon: CustomSvgPicture(
                      path: AppIcons.assetsIconsEmailRounded,
                    ),
                  ),
                  const SizedBox(height: 40),
                  MainButton(
                    text: 'SENT',
                    onPressed: () {
                      context.pushTo(const VerificationView());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
