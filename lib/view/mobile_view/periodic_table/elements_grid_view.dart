import 'package:flutter/material.dart';

import '../../../model/element.dart';
import 'element_body.dart';

class ElementsGridView extends StatelessWidget {
  final int crossCount;
  final double  aspectRatio;
  final List<ElementModel>? elements;
  final bool inTable;
  const ElementsGridView({Key? key,required this.elements,required this.crossCount,required this.inTable, required this.aspectRatio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inTable? GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: crossCount==3?10:5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return ElementBody(
          inTable: inTable,
          element: elements![index],
        );
      },
      itemCount: elements!.length,
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
