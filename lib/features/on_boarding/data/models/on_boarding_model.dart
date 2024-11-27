import 'package:first_project/core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding,
    title: "Explor The history with Museum in a smart way",
    subTitle:
        "Using our apps history libraries you can find many historical periods",
  ),
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding1,
    title: "From every place on earth",
    subTitle: "A big variety of ancient places from all over the world",
  ),
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding2,
    title: "Using modern AI technology for better user experience",
    subTitle:
        "AI Provide recommendation and helps you to continue the search journey",
  )
];
