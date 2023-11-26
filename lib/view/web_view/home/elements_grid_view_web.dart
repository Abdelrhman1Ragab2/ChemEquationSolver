import 'package:flutter/material.dart';

import '../../../core/utils/constant.dart';
import '../../../model/element.dart';
import '../../mobile_view/periodic_table/element_body.dart';

class ElementsGridViewWeb extends StatelessWidget {
  final int crossCount;
  final double  aspectRatio;
  final List<ElementModel>? elements;
  final bool inTable;
  const ElementsGridViewWeb({Key? key,required this.elements,required this.crossCount,required this.inTable, required this.aspectRatio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count=0;
    int laCount=56;
    int acCount=88;
    return inTable? GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: crossCount==3?10:5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {

        if(  AppConstant.realPlace[count]==index+1){
          if(count>=56 && count<=73  ){
            count++;
            return
              ElementBody(
                inTable: inTable,
                element: elements![count+13],
              );
          }else if(count>=74 && count<=89){
            count++;
            return
              ElementBody(
                inTable: inTable,
                element: elements![count+27],
              );
          }
          else if(count>=90 && count<104){
            count++;
            laCount++;
            return ElementBody(
              inTable: inTable,
              element: elements![laCount-1],
            );
          }else if(count>=104 && count<118){
            count++;
            acCount++;
            return ElementBody(
              inTable: inTable,
              element: elements![acCount-1],
            );
          }
          else{
            count++;
            return ElementBody(
              inTable: inTable,
              element: elements![count-1],
            );
          }


        }
        return const SizedBox();
      },
      itemCount: 160,
    ):
     ListView.separated(

         itemBuilder: (context,index){
      return ElementBody(
        inTable: inTable,
        element: elements![index],
      );
    },
        separatorBuilder: (context,index)=>const SizedBox(height: 10,), itemCount: elements!.length);

  }
}
