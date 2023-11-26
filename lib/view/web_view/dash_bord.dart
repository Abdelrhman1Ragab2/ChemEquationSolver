import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/dash_bord_provider.dart';
import 'menu/menu_view.dart';

class DashBordView extends StatelessWidget {
  const DashBordView({Key? key}) : super(key: key);
  static const String routeName="DashBordView";

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<DashBoardProvider>(context).menusSelectedIndex;
    return Scaffold(
      body: buildBody(context,currentIndex),
    );
  }


  Widget buildBody(BuildContext context,int currentIndex) {
    return Row(
      children: [
        Expanded(flex: 1, child: menuBody()),
        Expanded(flex: 4, child: homeBody(context,currentIndex)),


      ],
    );
  }

  Widget menuBody() {
    return const MenuUI();
  }

  Widget homeBody(BuildContext context,int index) {
    return SizedBox(
        height: double.maxFinite,
        child: Provider.of<DashBoardProvider>(context).homeScreens[index]);
  }


}
