import 'package:equation/controller/provider/search_Provider.dart';
import 'package:equation/model/element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/element_provider.dart';
import '../../../core/widget/search_page_view.dart';
import 'elements_grid_view.dart';

class PeriodicTable extends StatelessWidget {
  PeriodicTable({Key? key}) : super(key: key);
  static const String routeName="PeriodicTable";

  final ElementModel _fakeElement = ElementModel(
      id: "10",
      name: "	Neon",
      atomicNumber: 10,
      code: "Ne",
      molarMass: 20.180,
      group: 18,
      period: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Periodic Table"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SearchPageView(),
          Expanded(flex:5,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: periodicTableBody(context),
          )),
          // Expanded(flex: 1,
          //   child: TextButton(
          //       onPressed: () {
          //         Provider.of<ElementProvider>(context, listen: false)
          //             .addElement(_fakeElement);
          //       },
          //       child: const Text("add element")),
          // )
        ],
      ),
    );
  }

  Widget periodicTableBody(BuildContext context) {
    return StreamBuilder<List<ElementModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var elements = snapshot.data;
          final searchToken=Provider.of<SearchProvider>(context).searchToken;
          if(searchToken!=null){
            elements=Provider.of<SearchProvider>(context,listen: false).filterElement(elements!, searchToken);
          }
          return elements!.isEmpty?const Text("no found element"):
          ElementsGridView(elements: elements,crossCount: 4,inTable: true,aspectRatio: 0.95,);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      stream: Provider.of<ElementProvider>(context).getElementsStream(),
    );
  }

}
