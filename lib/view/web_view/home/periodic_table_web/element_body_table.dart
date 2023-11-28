import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/snack_bar.dart';
import '../../../../model/element.dart';

class ElementBodyInTable extends StatelessWidget {
  final ElementModel element;

  const ElementBodyInTable({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<PerformEquationProvider>(context, listen: false)
            .activateElements(element);
        Navigator.pop(context);
        showSnackBar(
            context: context,
            color: AppColor.colorB,
            message: "${element.name} element added successfully");
      },
      child: Container(
          decoration: BoxDecoration(
            color: mapElementToColor(),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
          ),
          padding: const EdgeInsets.all(0),
          child: itemBuildBody(context)),
    );
  }

  Widget itemBuildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kIsWeb
            ? Text(element.atomicNumber.toString(), style: AppStyle.style10)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(element.molarMass.toString(), style: AppStyle.style10),
                  Text(
                    element.atomicNumber.toString(),
                    style: AppStyle.style14,
                  )
                ],
              ),
        const SizedBox(
          height: 2,
        ),
        Text(
          element.code,
          style: AppStyle.style14,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          element.name,
          style: AppStyle.style10,
        ),
      ],
    );
  }

  Color? mapElementToColor() {
    if (element.atomicNumber >= 57 && element.atomicNumber <= 70 ||
        element.atomicNumber >= 89 && element.atomicNumber <= 102) {
      return Colors.greenAccent;
    }
    if (element.group <= 2 || element.atomicNumber == 2) {
      return Colors.red.shade200;
    }
    if (element.group >= 13) {
      return Colors.yellow.shade400;
    } else if (element.group >= 3 && element.group <= 12) {
      return Colors.blueAccent.shade200;
    }
  }
}
