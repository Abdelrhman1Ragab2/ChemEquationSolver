import 'package:equation/view/web_view/home/periodic_table_web/element_body_table.dart';
import 'package:flutter/material.dart';

import '../../../model/element.dart';

class ElementsGridView extends StatelessWidget {
  final int crossCount;
  final double  aspectRatio;
  final List<ElementModel>? elements;
  final bool inTable;
  const ElementsGridView({Key? key,required this.elements,required this.crossCount,required this.inTable, required this.aspectRatio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: crossCount==3?10:5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
          return ElementBodyInTable(
          element: elements![index],
        );
      },
      itemCount: elements!.length,
    );

  }
}
