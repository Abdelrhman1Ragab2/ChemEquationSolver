import '../../model/onboarding.dart';

abstract class StaticData{
  static const  List<OnBoarding> onBoardingList =  [
  OnBoarding(
  title: "Explore the Elements",
  content:
  " Discover and learn about the elements of the periodic table. Dive into their properties, atomic structures, and common uses.",
  imageUrl: "assets/images/chemistry.png"),
  OnBoarding(
  title: "Interactive Experiments",
  content:
  "Step into the virtual laboratory and perform interactive experiments. Safely explore chemical reactions, observe the outcomes, and understand the underlying principles. ",
  imageUrl: "assets/images/laboratory.png"),
  OnBoarding(
  title: "Collaborate and Connect",
  content: "Connect and collaborate with fellow chemistry enthusiasts. Join discussion forums, participate in group projects, and share your knowledge with the community",
  imageUrl: "assets/images/science.png"),

  ];

}