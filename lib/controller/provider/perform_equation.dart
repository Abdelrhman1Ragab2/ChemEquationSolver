import 'package:flutter/material.dart';

class PerformEquationProvider with ChangeNotifier{
  TextEditingController controllerA=TextEditingController();
  TextEditingController controllerB=TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading=false;
  String? functionOutput;

  deleteResult(){
    functionOutput=null;
    notifyListeners();
  }

  void onSubmit({required double atomic,required double mass}) async{
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();

      try{
        isLoading=true;
        notifyListeners();
        functionOutput=dummyEquation(atomic: atomic,mass: mass);
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

  String dummyEquation({required double atomic,required double mass}){

    var fun=(atomic*double.parse(controllerA.text) + mass*double.parse(controllerB.text)).toString();
    return fun;
  }
}