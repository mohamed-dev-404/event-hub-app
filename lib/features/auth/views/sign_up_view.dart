import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/app_text_form_field.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/core/widgets/passwoed_text_field.dart';
import 'package:event_hub_app/features/auth/views/sign_in_view.dart';
import 'package:event_hub_app/features/auth/widgets/third_auth_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'sign up',
                      style: AppStyles.h4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AppTextFormField(
                    hintText: 'Full name',
                    prefixIcon: CustomSvgPicture(
                      path: AppIcons.assetsIconsPersonOutline,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AppTextFormField(
                    hintText: 'hebamaged@gmail.com',
                    prefixIcon: CustomSvgPicture(
                      path: AppIcons.assetsIconsEmailRounded,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordTextField(
                    hintText: 'your password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordTextField(
                    hintText: 'Confirm password',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MainButton(
                    text: 'SING UP',
                    onPressed: () {
                      context.pushReplacement(const SignInView());
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    'OR',
                    style: AppStyles.title2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const ThirdAuthButton(
                    text: 'Login with Google',
                    image: AppIcons.assetsIconsGoogle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ThirdAuthButton(
                    text: 'Login with Facebook',
                    image: AppIcons.assetsIconsFacebook2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?   ',
                          style: AppStyles.body3.copyWith(
                            color: AppColors.title,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushTo(const SignInView());
                          },
                          child: Text(
                            'sign in',
                            style: AppStyles.body3.copyWith(
                              color: AppColors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
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
