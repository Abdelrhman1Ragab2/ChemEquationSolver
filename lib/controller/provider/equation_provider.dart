import 'package:flutter/widgets.dart';

import '../../model/element.dart';

class EquationProvider with ChangeNotifier {
  // bool canDeleteElement=false;


  final List<ElementModel> activeElements = [];

  // toggleDeleteElement(bool newValue) {
  //   canDeleteElement=newValue;
  //   notifyListeners();
  // }

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
