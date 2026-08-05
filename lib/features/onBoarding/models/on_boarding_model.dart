import '../../../const/aseets.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final int id;
  final String title;
  final String subTitle;
  final String imagePath;
  OnBoardingModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
}

 List<OnBoardingModel> onBoardingsData({required BuildContext context}) {
  var s = S.of(context);
  return [
    OnBoardingModel(
      id: 1,
      title: s.onboardingTitle1,
      imagePath:Assets.onboarding1,
      subTitle: s.onboardingDescription1,
    ),
    OnBoardingModel(
      id: 2,
      title: s.onboardingTitle2,
      imagePath:Assets.onboarding2,
      subTitle: s.onboardingDescription2,
    ),
    OnBoardingModel(
      id: 3,
      title: s.onboardingTitle3,
      imagePath:Assets.onboarding3,
      subTitle: s.onboardingDescription3,
    ),

    OnBoardingModel(
      id: 4,
      title: s.onboardingTitle4,
      imagePath: Assets.onboarding4,
      subTitle: s.onboardingDescription4,
    ),
  ];
}
