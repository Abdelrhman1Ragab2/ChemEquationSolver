import 'package:flutter/cupertino.dart';

class OnBoardingProvider with ChangeNotifier{

   PageController pageController=PageController();
  int currentIndex=0;
  onChanged(int index){
  currentIndex=index;
  notifyListeners();
  }
  next(){
  if(currentIndex<2){
  currentIndex++;
  pageController.jumpToPage(currentIndex);
  notifyListeners();
  }

  }

}