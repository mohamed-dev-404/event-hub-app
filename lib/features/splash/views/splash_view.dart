import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/features/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _scale = 600;

  @override
  void initState() {
    _startScaleAnimation();
    _navigate();
    super.initState();
  }

  void _navigate() {
    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      if (!mounted) return;
      context.pushReplacement(const OnboardingView());
    });
  }

  void _startScaleAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _scale = 1;
      });
    });
  }

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
          body: Center(
            child: AnimatedScale(
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              scale: _scale,
              child: CustomSvgPicture(
                path: AppImages.assetsImagesSplashLogo,
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
