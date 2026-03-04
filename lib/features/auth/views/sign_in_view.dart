import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/app_text_form_field.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/core/widgets/passwoed_text_field.dart';
import 'package:event_hub_app/features/auth/views/resset_password_view.dart';
import 'package:event_hub_app/features/auth/views/sign_up_view.dart';
import 'package:event_hub_app/features/auth/widgets/third_auth_button.dart';
import 'package:event_hub_app/features/nav_bar/views/nav_bar_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool remmberMe = false;
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomSvgPicture(
                    path: AppImages.assetsImagesLogoWithTitle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'sign in',
                      style: AppStyles.h4,
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
                    height: 18,
                  ),

                  const PasswordTextField(),
                  const SizedBox(
                    height: 44,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale:
                            0.8, // Adjust scale to match your design's size exactly
                        child: Switch(
                          value: remmberMe,
                          activeThumbColor: AppColors
                              .white, // The specific blue from your design
                          activeTrackColor: AppColors.primaryBlue,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.haifGray,
                          onChanged: (bool value) {
                            setState(() {
                              remmberMe = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 4), // Gap between switch and text
                      Text(
                        'Remember Me',
                        style: AppStyles.body3.copyWith(color: AppColors.title),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.pushTo(const RessetPasswordView());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppStyles.body3.copyWith(
                            color: AppColors.title,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  MainButton(
                    text: 'sign in',
                    onPressed: () {
                      context.pushReplacement(const NavBarView());
                    },
                  ),
                  const SizedBox(
                    height: 18,
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
                          'Don’t have an account?   ',
                          style: AppStyles.body3.copyWith(
                            color: AppColors.title,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushTo(const SignUpView());
                          },
                          child: Text(
                            'sign up',
                            style: AppStyles.body3.copyWith(
                              color: AppColors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
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
