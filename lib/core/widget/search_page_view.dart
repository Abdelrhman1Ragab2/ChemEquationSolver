import 'package:equation/controller/provider/element_provider.dart';
import 'package:equation/controller/provider/search_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);
  static const String routeName = "/SearchPageView";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: Provider.of<SearchProvider>(context).searchController,
          decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        hintText: "search",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.white,
            )),
      )
      ,
      onChanged: (value){
            Provider.of<SearchProvider>(context,listen: false).activateElement();
      },),
    );
  }
}
