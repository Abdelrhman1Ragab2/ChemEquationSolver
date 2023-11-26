import 'package:equation/model/user.dart';

import '../../model/element.dart';
import '../../model/menu.dart';
import '../Data/assets_data.dart';


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


    static const List<MenuModel> menus=[
    MenuModel(title: "Preparation Solution1",imageUrl:AssetsData.science),
    MenuModel(title: "Preparation Solution2", imageUrl: AssetsData.laboratory,),
    MenuModel(title: "Preparation Solution3", imageUrl: AssetsData.chemistry,),



  ];

  static const List<int> realPlace=[1, 18, 19, 20, 31, 32, 33, 34, 35, 36, 37, 38,49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 129,130,131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 147,148,149,150,151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165];



}
