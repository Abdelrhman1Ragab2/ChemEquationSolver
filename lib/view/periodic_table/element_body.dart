import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widget/snack_bar.dart';
import '../../model/element.dart';

class ElementBody extends StatelessWidget {
  final ElementModel element;
  final bool inTable;

  const ElementBody({Key? key, required this.element, required this.inTable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (inTable) {
          Provider.of<PerformEquationProvider>(context, listen: false)
              .activateElements(element);
          Navigator.pop(context);
          showSnackBar(
              context: context,
              color: Colors.blueGrey,
              message: "${element.name} element added successfully");
        }
      },
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.colorA,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: itemBuildBody(context, inTable)),
    );
  }

  Widget itemBuildBody(BuildContext context, bool isTable) {
    return isTable
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(element.molarMass.toString(),
                      style: inTable ? AppStyle.style10 : AppStyle.style12),
                  Text(
                    element.atomicNumber.toString(),
                    style: inTable ? AppStyle.style14 : AppStyle.style16,
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                element.code,
                style: inTable ? AppStyle.style16 : AppStyle.style18,
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: !inTable
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  inTable
                      ? const SizedBox(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            Provider.of<PerformEquationProvider>(context,
                                    listen: false)
                                .deleteElementFromActiveElements(element.id);
                            showSnackBar(
                                context: context,
                                color: AppColor.defaultColor,
                                message:
                                    "${element.name} element deleted successfully");

                            Provider.of<PerformEquationProvider>(context,
                                    listen: false)
                                .deleteResult();
                          },
                          icon: const Icon(Icons.delete)),
                  inTable ? const SizedBox() : const Spacer(),
                  Text(
                    element.name,
                    style: inTable ? AppStyle.style10 : AppStyle.style14,
                  ),
                ],
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                element.name,
                style: inTable ? AppStyle.style10 : AppStyle.style14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "( ${element.code} )",
                style: inTable ? AppStyle.style16 : AppStyle.style18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(element.molarMass.toString(),
                  style: inTable ? AppStyle.style10 : AppStyle.style12),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                height: 2,
              ),
              inTable
                  ? const SizedBox(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () {
                        Provider.of<PerformEquationProvider>(context,
                                listen: false)
                            .deleteElementFromActiveElements(element.id);
                        showSnackBar(
                            context: context,
                            color: AppColor.defaultColor,
                            message:
                                "${element.name} element deleted successfully");

                        Provider.of<PerformEquationProvider>(context,
                                listen: false)
                            .deleteResult();
                      },
                      icon: const Icon(Icons.delete)),
            ],
          );
  }
}
