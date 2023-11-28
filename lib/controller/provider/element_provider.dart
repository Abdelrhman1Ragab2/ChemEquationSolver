import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equation/model/element.dart';
import 'package:flutter/material.dart';

import '../../core/Data/periodic_data.dart';


class ElementProvider with ChangeNotifier {

  final _elementCollection = FirebaseFirestore.instance
      .collection("elements")
      .withConverter(
      fromFirestore: ElementModel.fromFirebase, toFirestore: ElementModel.toFirebase);

  List<ElementModel> allElement=[];

  cachingElement(List<ElementModel> data){
    allElement=data;
  }

// use it to add all element to firebase
  // Future<void> addAllElement() async {
  //
  //   for(int i=0;i<periodicData.length;i++){
  //    ElementModel element= ElementModel.fromJson(periodicData[i]);
  //    await _elementCollection.doc().set(element);
  //    print("$i done ");
  //
  //   }
  // }

  Future<void> addElement(ElementModel element) async {
    await _elementCollection.doc().set(element);
  }

  Future<void> deleteElement(String elementId) async {
    await _elementCollection.doc(elementId).delete();
  }

  Future<List<ElementModel>> getFutureElements() {
    Query<ElementModel> query =
    _elementCollection.orderBy(ElementModel.elementAtomicKey, descending: false);
    return query.snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList()).single;
  }





}