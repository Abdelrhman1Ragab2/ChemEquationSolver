import 'package:equation/view/mobile_view/equations/prepartion_equation.dart';
import 'package:flutter/material.dart';

import '../../model/menu.dart';
import '../../view/web_view/home/equations_web/preparation_equation_web.dart';

class DashBoardProvider with ChangeNotifier {
  int menusSelectedIndex = 0;
  List<Widget> homeScreens = [
    const PreparationEquationWebView(),

    const Center(child: Text("Next version will be complete this equation 2 .. ")),
    const Center(child: Text("Next version will be complete this equation 3 .. ")),
    const Center(child: Text("Next version will be complete this equation 4 .. ")),
    const Center(child: Text("Next version will be complete this equation 5 ..")),
    const Center(child: Text("Next version will be complete this equation 6 ..")),

  ];

  void changeMenuIndex(int index) {
    menusSelectedIndex = index;
    notifyListeners();
  }
}
