import 'package:cloud_firestore/cloud_firestore.dart';

class ElementModel {
  final String id;
  final int atomicNumber;
  final String name;
  final String code;
  final double molarMass;
  final int group;
  final int period;

  ElementModel(
      {required this.id,
      required this.name,
      required this.atomicNumber,
      required this.code,
      required this.molarMass,
      required this.group,
      required this.period});

  static Map<String, dynamic> toFirebase(
      ElementModel element,
    SetOptions? options,
  ) {
    return {
      elementIdKey: element.id,
      elementNameKey: element.name,
      elementCodeKey: element.code,
      elementGroupKey: element.group,
      elementPeriodKey: element.period,
      elementAtomicKey: element.atomicNumber,
      elementMassKey: element.molarMass,
    };
  }

  static ElementModel fromFirebase(DocumentSnapshot ds, SnapshotOptions? options) {
    return ElementModel(
        id: ds.id,
        code: ds.get(elementCodeKey),
        period: ds.get(elementPeriodKey),
        group: ds.get(elementGroupKey),
        name: ds.get(elementNameKey),
        molarMass: ds.get(elementMassKey),
        atomicNumber: ds.get(elementAtomicKey));
  }

  // factory ElementModel.fromJson(Map<String,dynamic> jsonData){
  //   return ElementModel(
  //       id:jsonData["number"].toString() ,
  //       name: jsonData["name"],
  //       atomicNumber: jsonData["number"],
  //       code: jsonData["symbol"],
  //       molarMass: jsonData["atomic_mass"],
  //       group: jsonData["group"],
  //       period: jsonData["period"]);
  // }

  static const String elementIdKey = "id";
  static const String elementNameKey = "name";
  static const String elementCodeKey = "code";
  static const String elementGroupKey = "group";
  static const String elementPeriodKey = "period";
  static const String elementAtomicKey = "atomic_number";
  static const String elementMassKey = "molar_mass";
}
