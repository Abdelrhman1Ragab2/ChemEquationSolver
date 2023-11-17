import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equation/model/element.dart';
import 'package:flutter/material.dart';


class ElementProvider with ChangeNotifier {

  final _elementCollection = FirebaseFirestore.instance
      .collection("elements")
      .withConverter(
      fromFirestore: ElementModel.fromFirebase, toFirestore: ElementModel.toFirebase);




  Future<void> addElement(ElementModel element) async {
    await _elementCollection.doc().set(element);
  }

  Future<void> deleteElement(String elementId) async {
    await _elementCollection.doc(elementId).delete();
  }

  Stream<List<ElementModel>> getElementsStream() {
    Query<ElementModel> query =
    _elementCollection.orderBy(ElementModel.elementAtomicKey, descending: false);
    return query.snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }





}