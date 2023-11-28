import 'package:equation/controller/provider/dash_bord_provider.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/constant.dart';
import 'package:equation/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/menu.dart';

class MenuUI extends StatelessWidget {
  const MenuUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context){
    return Container(
      height: double.maxFinite,
      color: AppColor.colorA,
      child: menusBody(context)
    );

  }

  Widget menusBody(BuildContext context){
    return ListView.separated(
        itemBuilder: (context,index)=>itemBody(
            context,AppConstant.menus[index],index),
        separatorBuilder: (_,__)=>const SizedBox(height: 5,),
        itemCount: AppConstant.menus.length);
  }

  Widget itemBody(BuildContext context,MenuModel menu,index){
    bool isSelectedIndex=index==Provider.of<DashBoardProvider>(context).menusSelectedIndex;
    return Card(
      elevation: 20,
      color: isSelectedIndex?AppColor.colorC: AppColor.colorB,
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title:Text(menu.title,style:isSelectedIndex?AppStyle.style16:AppStyle.style16W,) ,
        trailing: Image.asset(menu.imageUrl,height: 50,width: 50,),
        onTap: (){
          Provider.of<DashBoardProvider>(context,listen: false).changeMenuIndex(index);
        },

      ),
    );
  }
}
