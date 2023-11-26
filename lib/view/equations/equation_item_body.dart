

import 'package:equation/core/utils/style.dart';
import 'package:equation/view/equations/prepartion_equation.dart';
import 'package:flutter/material.dart';

import '../../core/Data/assets_data.dart';
import '../../core/widget/reating.dart';

class EquationItem extends StatelessWidget {
  const EquationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, PreparationEquation.routeName);
      },
      child: Card(
        elevation: 10,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.chemistry,
                height: 75,
                width: 75,
              ),
              const SizedBox(width: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Text(
                        "Preparation of solutions",
                        style: AppStyle.style16,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                  // const SizedBox(height: 5,),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("free"),
                  //     RatingBody()
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
