import 'package:equation/view/mobile_view/equations/prepartion_equation.dart';
import 'package:flutter/material.dart';

import '../../model/menu.dart';
import '../../view/web_view/home/periodic_table_web.dart';
import '../../view/web_view/home/preparation_equation_web.dart';

class DashBoardProvider with ChangeNotifier {
  int menusSelectedIndex = 0;
  List<Widget> homeScreens = [
    const PreparationEquationWebView(),
    PeriodicTableWeb(),
    const PreparationEquation()
  ];

  void changeMenuIndex(int index) {
    menusSelectedIndex = index;
    notifyListeners();
  }
}
