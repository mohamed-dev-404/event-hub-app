import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/features/auth/views/sign_in_view.dart';
import 'package:event_hub_app/features/onboarding/data/data_sources/onboarding_data.dart';
import 'package:event_hub_app/features/onboarding/widgets/onboarding_content_section.dart';
import 'package:event_hub_app/features/onboarding/widgets/onboarding_image_section.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentIndex = 0;

  void _handleNext() {
    if (_currentIndex < OnboardingData.onBoardingitems.length - 1) {
      setState(() => _currentIndex++);
    } else {
      _navigateToSignIn();
    }
  }

  void _navigateToSignIn() {
    context.pushReplacement(const SignInView());
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = OnboardingData.onBoardingitems[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          OnboardingImageSection(
            image: currentItem.image,
            index: _currentIndex,
          ),
          OnboardingContentSection(
            title: currentItem.title,
            body: currentItem.body,
            currentIndex: _currentIndex,
            totalCount: OnboardingData.onBoardingitems.length,
            onNext: _handleNext,
            onSkip: _navigateToSignIn,
          ),
        ],
      ),
    );
  }
}
