import 'package:equation/controller/provider/equation_provider.dart';
import 'package:equation/core/Data/app_color.dart';
import 'package:equation/core/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widget/snack_bar.dart';
import '../../model/element.dart';

class ElementBody extends StatelessWidget {
  final ElementModel element;
  final bool canDelete;

  const ElementBody({Key? key, required this.element, required this.canDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<EquationProvider>(context, listen: false)
            .activateElements(element);
        Navigator.pop(context);
        showSnackBar(
            context: context,
            message: "${element.name} element added successfully");
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
              height: 5,
            ),
            Text(
              element.code,
              style: AppStyle.style16,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: canDelete
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                canDelete
                    ? IconButton(
                        onPressed: () {
                          Provider.of<EquationProvider>(context, listen: false)
                              .deleteElement(element.id);
                          showSnackBar(
                              context: context,
                              message:
                                  "${element.name} element deleted successfully");
                        },
                        icon: const Icon(Icons.delete))
                    : const SizedBox(
                        width: 0,
                      ),
                canDelete ? const Spacer() : const SizedBox(),
                Text(
                  element.name,
                  style: AppStyle.style10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
