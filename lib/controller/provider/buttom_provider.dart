import 'package:equation/view/home_page/equation_view.dart';
import 'package:equation/view/home_page/experiment.dart';
import 'package:equation/view/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';

class BottomProvider with ChangeNotifier
{
  int currentIndex=1;
   List<Widget> bottomPages=const [EquationScreen(),HomeScreen(),ExperimentScreen()];
  changeIndex(int index){
    currentIndex=index;
    notifyListeners();
  }

}