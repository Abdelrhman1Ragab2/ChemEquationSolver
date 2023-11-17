
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:equation/core/Data/app_color.dart';
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
        splash:Image.asset("assets/images/chemistry.png") ,
        pageTransitionType: PageTransitionType.leftToRightJoined,
    );
  }
}
