import 'package:equation/model/user.dart';

import '../../controller/provider/perform_equation.dart';
import '../../model/element.dart';


class AppConstant {
  static final ElementModel fakeElement = ElementModel(
      id: "10",
      name: "	Neon",
      atomicNumber: 10,
      code: "Ne",
      molarMass: 20.180,
      group: 18,
      period: 2);

  static final AppUser fakeUser = AppUser(
      id: "fake",
      phone: "fake",
      name: "fake",
      imgUrl: "",
      bio: "",
      email: "",
      allowedCount: "10");

  static const String additiveElement="additive_element";
  static const String normalElement="normal_element";


}
