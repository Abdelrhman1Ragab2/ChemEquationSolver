import 'package:equation/controller/provider/authinticat.dart';
import 'package:equation/controller/provider/buttom_provider.dart';
import 'package:equation/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
        }, icon: const Icon(Icons.logout))],
        title: const Text("chemistry"),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColor.defaultColor,
        index: Provider.of<BottomProvider>(context).currentIndex,
        items: const <Widget>[
          Icon(Icons.account_tree, size: 22),
          Icon(Icons.home, size: 22),
          Icon(Icons.timelapse, size: 22),
        ],
        onTap: (index) {
          Provider.of<BottomProvider>(context, listen: false).changeIndex(index);
        },
      ),
      body: Provider.of<BottomProvider>(context, listen: false).bottomPages[
          Provider.of<BottomProvider>(context).currentIndex],
    );
  }
}
