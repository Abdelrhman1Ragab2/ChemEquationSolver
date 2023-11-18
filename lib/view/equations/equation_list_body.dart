
import 'package:flutter/material.dart';

import 'equation_item_body.dart';

class EquationList extends StatelessWidget {
  const EquationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
       return const EquationItem();
    },
        separatorBuilder: (context,index)=>const SizedBox(height: 10,), itemCount: 5);
  }
}
