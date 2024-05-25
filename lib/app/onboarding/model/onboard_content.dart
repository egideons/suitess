import 'package:kribb/src/constants/assets.dart';

import 'onboard_model.dart';

class OnboardContent {
  List<OnboardModel> items = [
    OnboardModel(
      title: "Welcome to Suitess",
      description:
          "Discover your dream home, investment property or rental with a personalized real estate experience.",
      image: Assets.onboarding1Svg,
    ),
    OnboardModel(
      title: "Perfect match for you",
      description:
          "Explore thousands of listings and discover your perfect property",
      image: Assets.onboarding2Svg,
    ),
  ];
}
