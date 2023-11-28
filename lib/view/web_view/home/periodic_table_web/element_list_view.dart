import 'package:flutter/material.dart';

import '../../../../model/element.dart';
import 'element_body.dart';

class ElementsListViewWeb extends StatelessWidget {
  final bool inTable;
  final List<ElementModel>? elements;

  const ElementsListViewWeb({Key? key, required this.elements, required this.inTable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ElementBody(
            inTable: inTable,
            element: elements![index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: elements!.length);
  }
}
