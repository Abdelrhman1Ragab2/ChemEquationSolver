import 'package:equation/controller/provider/equation_provider.dart';
import 'package:equation/model/element.dart';
import 'package:equation/view/periodic_table/element_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../periodic_table/periodic_table_view.dart';

class EquationScreen extends StatefulWidget {
  const EquationScreen({Key? key}) : super(key: key);
  static const String routeName = "EquationScreen";

  @override
  State<EquationScreen> createState() => _EquationScreenState();
}

class _EquationScreenState extends State<EquationScreen> {

  // late EquationProvider _equationProvider;
  // @override
  // void didChangeDependencies() {
  //   _equationProvider = Provider.of<EquationProvider>(context, listen: false);
  //   super.didChangeDependencies();
  // }
  // @override
  // void deactivate() {
  //   super.deactivate();
  //   _equationProvider.deActivateElements();
  // }
  //
  @override
  Widget build(BuildContext context) {
    List<ElementModel> elements =
        Provider.of<EquationProvider>(context).activeElements;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Visibility(
                  visible: elements.isNotEmpty,
                  child: ListView.separated(
                      itemCount: elements.length,
                      itemBuilder: (context, index) => ElementBody(
                        canDelete: true,
                        element: elements[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),)),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PeriodicTable.routeName);
                  },
                  child: const Text("chose Element ")),
            ),
          ],
        ),
      ),
    );
  }
}
