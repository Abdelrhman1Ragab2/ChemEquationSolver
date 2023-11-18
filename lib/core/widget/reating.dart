import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBody extends StatelessWidget {
  const RatingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.star,color: Colors.yellow,)),
        Text("4.8 (243)")
      ],
    );
  }
}
