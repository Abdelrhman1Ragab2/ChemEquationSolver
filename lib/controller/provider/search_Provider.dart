import 'package:flutter/cupertino.dart';

import '../../model/element.dart';

class SearchProvider with ChangeNotifier{
  TextEditingController searchController=TextEditingController();


  activateElement(){
    notifyListeners();
  }

  List<ElementModel> filterElement(List<ElementModel>elements,String filterToken) {
    List<ElementModel> newElements=[];
    for (var element in elements) {
      if(element.name.toLowerCase().contains(filterToken)||element.name.toUpperCase().contains(filterToken)){
        newElements.add(element);
      }
    }
    return newElements;
  }

}