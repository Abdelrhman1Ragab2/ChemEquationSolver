import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widget/snack_bar.dart';
import '../../../../model/element.dart';

class ElementBody extends StatelessWidget {
  final ElementModel element;
  final bool inTable;

  const ElementBody({
    Key? key,
    required this.element,required this.inTable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool fakeElement=element.period==010;
    return GestureDetector(
      onTap: () {
        if(!fakeElement && inTable){ // first fake element represent data title
          Provider.of<PerformEquationProvider>(context, listen: false)
              .activateElements(element);
          Navigator.pop(context);
          showSnackBar(
              context: context,
              color: AppColor.colorB,
              message: "${element.name} element added successfully");
        }

      },
      child: Container(
          decoration: BoxDecoration(
            color: fakeElement?AppColor.colorA:AppColor.colorD,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: itemBuildBody(context,fakeElement)),
    );
  }

  Widget itemBuildBody(BuildContext context,bool fakeElement) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            element.name,
            style: fakeElement?AppStyle.style16W:AppStyle.style16,
          ),
        ),
        Expanded(
          child: Text(
            "( ${element.code} )",
            style: fakeElement?AppStyle.style16W:AppStyle.style16,
          ),
        ),
        Expanded(
          child: Text(fakeElement?"molar Mass":element.molarMass.toStringAsFixed(3), style:fakeElement?AppStyle.style16W: AppStyle.style14,textAlign: TextAlign.center,),
        ),
        Expanded(
          child: Text(fakeElement?"atomic Number":element.atomicNumber.toString(), style:fakeElement?AppStyle.style16W: AppStyle.style14,textAlign: TextAlign.center,),
        ),
        Expanded(
          child: Text(fakeElement?"Period":element.period.toString(), style:fakeElement?AppStyle.style16W: AppStyle.style14,textAlign: TextAlign.center,),
        ),
        Expanded(
          child: Text(fakeElement?"Group":element.group.toString(), style:fakeElement?AppStyle.style16W: AppStyle.style14,textAlign: TextAlign.center,),
        ),
        inTable?const SizedBox():Expanded(
          child: Visibility(
              visible: !fakeElement && !inTable,
              child: IconButton(
                  onPressed: () {
                    Provider.of<PerformEquationProvider>(context, listen: false)
                        .deleteElementFromActiveElements(element.id);
                    showSnackBar(
                        context: context,
                        color: AppColor.colorA,
                        message: "${element.name} element deleted successfully");

                    Provider.of<PerformEquationProvider>(context, listen: false)
                        .deleteResult();
                  },
                  icon: const Icon(Icons.delete)),
            ),
        ),
      ],
    );
  }
}
