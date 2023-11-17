import 'package:flutter/cupertino.dart';

import '../../model/element.dart';

class SearchProvider with ChangeNotifier{
  String? searchToken;


  activateElement(String token){
    searchToken=token;
    notifyListeners();
  }

  List<ElementModel> filterElement(List<ElementModel>elements,String filterToken) {
    List<ElementModel> newElements=[];
    for (var element in elements) {
      if(element.name.contains(filterToken)){
        newElements.add(element);
      }
    }
    return newElements;
  }

}