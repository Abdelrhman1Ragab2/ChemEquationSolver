import 'package:equation/controller/provider/element_provider.dart';
import 'package:equation/controller/provider/search_Provider.dart';
import 'package:equation/core/utils/style.dart';
import 'package:equation/model/element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/search_page_view.dart';
import 'element_list_view.dart';
import 'elements_grid_view_web.dart';

class PeriodicTableWeb extends StatelessWidget {
  PeriodicTableWeb({Key? key}) : super(key: key);
  static const String routeName = "/PeriodicTableWeb";
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Periodic Table"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          screenWidth = constraints.maxWidth;
          screenHeight = constraints.maxHeight;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SearchPageView(),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: periodicTableBodyWeb(context),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget periodicTableBodyWeb(BuildContext context) {
    bool hasCaching=Provider.of<ElementProvider>(context).allElement.isNotEmpty;
    print(hasCaching);
    return hasCaching?cachingPeriodicTable(context):unCachingPeriodicTable(context);
  }

  Widget unCachingPeriodicTable(BuildContext context){
     return FutureBuilder<List<ElementModel>>(
      future: Provider.of<ElementProvider>(context).getFutureElements(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var elements = snapshot.data;
          Provider.of<ElementProvider>(context,listen: false).cachingElement(elements!);
          // try to listen searchToken
          String searchToken =
              Provider.of<SearchProvider>(context).searchController.text;
          if (searchToken.isNotEmpty) {
            // filter data using search token
            elements = Provider.of<SearchProvider>(context, listen: false)
                .filterElement(elements!, searchToken);

            // add fake element as title
            elements.insert(0, ElementModel(
                id: "id",
                name: "name",
                atomicNumber: 010,
                code: "Symbol",
                molarMass: 010,
                group: 010,
                period: 010));


            return elements.length<=1
                ? const Center(child:  Text("no found element",style: AppStyle.style18,))
                : ElementsListViewWeb(elements: elements,inTable: true,);
          }
          // return periodic table
          return ElementsGridViewWeb(
            elements: elements,
            crossCount: 18,
            inTable: true,
            aspectRatio: 0.95,
          ); // build all table
        } else if (snapshot.hasError) {
          // has error
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          //loading
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

  }

  Widget cachingPeriodicTable(BuildContext context){
    List<ElementModel> elements=Provider.of<ElementProvider>(context,listen: false).allElement;
    String searchToken =
        Provider.of<SearchProvider>(context).searchController.text;
    if (searchToken.isNotEmpty) {
      // filter data using search token
      elements = Provider.of<SearchProvider>(context, listen: false)
          .filterElement(elements, searchToken);

      // add fake element as title
      elements.insert(0, ElementModel(
          id: "id",
          name: "name",
          atomicNumber: 010,
          code: "Symbol",
          molarMass: 010,
          group: 010,
          period: 010));


      return elements.length<=1
          ? const Center(child:  Text("no found element",style: AppStyle.style18,))
          : ElementsListViewWeb(elements: elements,inTable: true,);
    }
    // return periodic table
    return ElementsGridViewWeb(
      elements: elements,
      crossCount: 18,
      inTable: true,
      aspectRatio: 0.95,
    );
  }
}
