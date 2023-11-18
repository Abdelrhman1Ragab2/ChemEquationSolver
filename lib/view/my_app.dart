
import 'package:equation/controller/provider/authinticat.dart';
import 'package:equation/controller/provider/user_provider.dart';
import 'package:equation/core/app_color.dart';
import 'package:equation/core/constant.dart';
import 'package:equation/view/home_page/home_page_view.dart';
import 'package:equation/view/on_bording/on_boarding_view.dart';
import 'package:equation/view/periodic_table/periodic_table_view.dart';
import 'package:equation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/Shared_preferences.dart';
import '../model/user.dart';
import 'auth.dart';
import 'equations/dummy_equation.dart';

class MyApp extends StatelessWidget {
   final bool isFirstTime;
  const MyApp({Key? key,required this.isFirstTime}) : super(key: key);
  static const String routeName="MyApp";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser?>(
      initialData: AppConstant.fakeUser,
        stream: Provider.of<UserProvider>(context,listen: false).getCurrentUserStream(),
        builder: (context,snapShot){
          if(snapShot.hasError){
            return MaterialApp(
              home: Scaffold(body: Center(child: Text(snapShot.error.toString()),),),
            );
          }

            final AppUser? appUser=snapShot.data;
            return MaterialApp(

              debugShowCheckedModeBanner: false,
              home:mapUserToHome(context,appUser)  ,
              routes: {
                HomePage.routeName:(context)=>const HomePage(),
                PeriodicTable.routeName:(context)=> PeriodicTable(),
                DummyEquation.routeName:(context)=> const DummyEquation(),
                Auth.routeName:(context)=> const Auth(),
                MyApp.routeName:(context)=> const MyApp(isFirstTime: false),
              },
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColor.defaultColor,

                ),
              ),
            );



    });
  }
  Widget mapUserToHome(BuildContext context, AppUser? user) {
    if(isFirstTime){return const OnBoardingPage();}
    if (user == null) return const Auth();
    if (user.id == AppConstant.fakeUser.id) return  const SplashScreen();
    return const HomePage();
  }
}
