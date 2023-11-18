import 'package:flutter/widgets.dart';

import '../../model/element.dart';

class EquationProvider with ChangeNotifier {

  final List<ElementModel> activeElements = [];

  List<ElementModel>getActiveElements(){
    if(activeElements.isEmpty){

    }
    return activeElements;
  }
  activateElements(ElementModel newElement) {
    bool founded=false;
    for (var element in activeElements) {
      if(element.atomicNumber==newElement.atomicNumber){
        founded=true;
      }
    }
    if(!founded){
      activeElements.add(newElement);
      notifyListeners();
    }

  }

  deleteElement(String elementId){
    for (int index=0; index<activeElements.length;index++) {
      if(activeElements[index].id==elementId){
        activeElements.removeAt(index);
      }
    }
    notifyListeners();
  }

  deActivateElements() {
    activeElements.clear();
    notifyListeners();
  }


}
