import 'package:flutter/material.dart';

import '../../model/element.dart';

class PerformEquationProvider with ChangeNotifier{

  TextEditingController controllerA=TextEditingController();
  TextEditingController controllerB=TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading=false;
  String? functionOutput;

  List<ElementModel> activeElements = [];




  deleteResult(){
    functionOutput=null;
    notifyListeners();
  }

  void onSubmit() async{
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();

      try{
        isLoading=true;
        notifyListeners();
        functionOutput=getWeight().toStringAsFixed(3);
        isLoading=false;
        notifyListeners();
      }
      on Exception catch(error){
        if(error is FormatException){
          functionOutput="please enter only number! ";
        }
        else{
          functionOutput="${error.toString()} try again ";
        }
        isLoading=false;
        notifyListeners();
      }
    }

  }

  double getWeight(){

    double moles=double.parse(controllerA.text);
    double weight=activeElements[0].molarMass;
    double volume=double.parse(controllerB.text);

    return moles*weight*(volume/1000);


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
    }
    notifyListeners();
  }


  deleteElementFromActiveElements(String elementId){
    for (int index=0; index<activeElements.length;index++) {
      if(activeElements[index].id==elementId){
        activeElements.removeAt(index);
      }
    }
    notifyListeners();
  }

  resetPrepareEquation() {
    activeElements.clear();
    controllerA.text="";
    controllerB.text="";
     isLoading=false;
    functionOutput=null;
  }
}