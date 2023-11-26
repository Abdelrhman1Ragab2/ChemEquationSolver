import 'package:equation/core/utils/style.dart';
import 'package:equation/view/mobile_view/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/onboarding.dart';
import '../../../controller/provider/on_boarding_provider.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/Data/static_data.dart';
import '../../../core/utils/Shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  static const String routeName = "/OnBoardingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoardingBody(context),
    );
  }

  Widget onBoardingBody(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {},
              controller:
                  Provider.of<OnBoardingProvider>(context).pageController,
              itemCount: StaticData.onBoardingList.length,
              itemBuilder: (context, index) =>
                  onBoardingItems(StaticData.onBoardingList[index]),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          StaticData.onBoardingList.length,
                          (index) => AnimatedContainer(
                                margin: const EdgeInsets.only(right: 6),
                                duration: const Duration(milliseconds: 1000),
                                height: 6,
                                width: Provider.of<OnBoardingProvider>(context)
                                            .currentIndex ==
                                        index
                                    ? 18
                                    : 6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white),
                              ))
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      int currentIndex = Provider.of<OnBoardingProvider>(
                              context,
                              listen: false)
                          .currentIndex;
                      if (currentIndex == 2) {
                        AppSharedPref().storeUserInfo();
                        Navigator.pushReplacementNamed(
                            context, MyApp.routeName);

                      } else {
                        Provider.of<OnBoardingProvider>(context, listen: false)
                            .next();
                      }
                    },
                    color: AppColor.colorB,
                    child: const Text(
                      "Continue",
                      style: AppStyle.style14,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget onBoardingItems(OnBoarding onBoarding) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleBody(onBoarding.title),
        const SizedBox(height: 50),
        imageBody(onBoarding.imageUrl),
        const SizedBox(height: 20),
        contentBody(onBoarding.content),
      ],
    );
  }

  Widget titleBody(String title) {
    return Text(
      title,
      style: AppStyle.style20W,
    );
  }

  Widget contentBody(String content) {
    return Text(
      content,
      style: AppStyle.style16W,
      textAlign: TextAlign.center,
    );
  }

  Widget imageBody(String imgUrl) {
    return Image.asset(
      imgUrl,
      width: 150,
      height: 150,
    );
  }

// Widget buttonsBody( OnBoardingController onBoardingController) {
//   return Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ...List.generate(
//               StaticData.onBoardingList.length,
//               (index) => AnimatedContainer(
//                 margin: const EdgeInsets.only(right: 5),
//                     duration: const Duration(milliseconds: 500),
//               height: 6,
//               width: onBoardingController.currentIndex==index?18:6,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
//               color: Colors.blue),
//               ))
//         ],
//       ),
//       MaterialButton(onPressed: (){
//         onBoardingController.next();
//         print(onBoardingController.currentIndex);
//       },
//       color: Colors.blue.shade200,
//       child: const  Text("Continue"),)
//     ],
//   );
// }
}
