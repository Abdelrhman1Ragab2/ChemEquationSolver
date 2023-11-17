import 'package:equation/controller/provider/equation_provider.dart';
import 'package:equation/controller/provider/search_Provider.dart';
import 'package:equation/core/Data/app_color.dart';
import 'package:equation/view/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controller/provider/authinticat.dart';
import 'controller/provider/buttom_provider.dart';
import 'controller/provider/element_provider.dart';
import 'controller/provider/on_boarding_provider.dart';
import 'controller/provider/user_provider.dart';
import 'core/Shared_preferences.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isFirstTime = await AppSharedPref().isFirstTimeUser();
  print(isFirstTime);

  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ElementProvider()),
      ChangeNotifierProvider(create: (_) => BottomProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => EquationProvider()),
    ],
    child:  MyApp(isFirstTime:isFirstTime ),
  ),);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black45
  ));
}



