
import 'package:flutter/material.dart';

class ExperimentScreen extends StatelessWidget {
  const ExperimentScreen({Key? key}) : super(key: key);
  static const String routeName="ExperimentScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(routeName),
      ),
    );
  }
}
