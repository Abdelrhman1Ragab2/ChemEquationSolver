
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'auth.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return
      AnimatedSplashScreen(
        backgroundColor: AppColor.defaultColor,
        splashIconSize: 150.0,
        nextScreen: const Auth(),
        duration: 3000,
        curve: Curves.linear,
        splashTransition: SplashTransition.scaleTransition,
        splash:Column(
          children: [
            Image.asset("assets/images/chemistry.png",height: 125,width: 125,),
            const Text("welcome to in our app",style: AppStyle.style20W,)
          ],
        ) ,
        pageTransitionType: PageTransitionType.leftToRightJoined,
    );
  }
}
