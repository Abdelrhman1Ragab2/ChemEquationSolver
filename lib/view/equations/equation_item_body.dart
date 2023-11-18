

import 'package:equation/core/style.dart';
import 'package:equation/view/equations/dummy_equation.dart';
import 'package:flutter/material.dart';

import '../../core/Data/assets_data.dart';
import '../../core/widget/reating.dart';

class EquationItem extends StatelessWidget {
  const EquationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DummyEquation.routeName);
      },
      child: Card(
        elevation: 10,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsData.chemistry,
                height: 75,
                width: 75,
              ),
              const SizedBox(width: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Text(
                        "Mass molar equation",
                        style: AppStyle.style16,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                  const SizedBox(height: 5,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("free"),
                      RatingBody()
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
