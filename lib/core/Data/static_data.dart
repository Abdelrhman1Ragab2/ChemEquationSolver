import 'package:equation/core/Data/assets_data.dart';

import '../../model/onboarding.dart';

abstract class StaticData{
  static const  List<OnBoarding> onBoardingList =  [
  OnBoarding(
  title: "Explore the Elements",
  content:
  " Discover and learn about the elements of the periodic table. Dive into their properties, atomic structures, and common uses.",
  imageUrl: AssetsData.chemistry),
  OnBoarding(
  title: "Interactive Experiments",
  content:
  "Step into the virtual laboratory and perform interactive experiments. Safely explore chemical reactions, observe the outcomes, and understand the underlying principles. ",
  imageUrl: AssetsData.laboratory),
  OnBoarding(
  title: "Collaborate and Connect",
  content: "Connect and collaborate with fellow chemistry enthusiasts. Join discussion forums, participate in group projects, and share your knowledge with the community",
  imageUrl: AssetsData.science),

  ];

}