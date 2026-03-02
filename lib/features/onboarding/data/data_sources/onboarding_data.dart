import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingData {
  static const List<OnboardingModel> onBoardingitems = [
    OnboardingModel(
      title: 'Explore Upcoming and Nearby Events',
      body:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: AppImages.assetsImagesOnBoarding1,
    ),
    OnboardingModel(
      title: 'Web Have Modern Events Calendar Feature',
      body:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: AppImages.assetsImagesOnBoarding2,
    ),
    OnboardingModel(
      title: 'To Look Up More Events or Activities Nearby By Map',
      body:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: AppImages.assetsImagesOnBoarding3,
    ),
  ];
}
