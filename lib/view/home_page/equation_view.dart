
import 'package:flutter/material.dart';

import '../equations/equation_list_body.dart';

class EquationScreen extends StatelessWidget {
  const EquationScreen({Key? key}) : super(key: key);
  static const String routeName = "EquationScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(padding: EdgeInsets.all(8.0), child: EquationList()),
    );
  }
}
