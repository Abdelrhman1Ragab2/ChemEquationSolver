import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/app_color.dart';
import 'package:equation/core/constant.dart';
import 'package:equation/core/style.dart';
import 'package:equation/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/equation_provider.dart';
import '../../model/element.dart';
import '../periodic_table/element_body.dart';
import '../periodic_table/elements_grid_view.dart';
import '../periodic_table/periodic_table_view.dart';

class DummyEquation extends StatelessWidget {
  const DummyEquation({Key? key}) : super(key: key);
  static const String routeName = "DummyEquation";

  @override
  Widget build(BuildContext context) {
    List<ElementModel> elements =
        Provider.of<EquationProvider>(context).activeElements;
    ElementModel testElement=elements.isNotEmpty?elements[0]:AppConstant.fakeElement;
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, PeriodicTable.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: Provider.of<PerformEquationProvider>(context, listen: false)
              .formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                    height: getHeight(elements.length),
                    padding: const EdgeInsets.all(8.0),
                    child: elements.isEmpty
                        ? const Text(
                            "please  add element frome periodic table! ",
                            style: AppStyle.style18,
                          )
                        : ElementsGridView(
                            elements: elements,
                            crossCount: 2,
                            inTable: false,
                            aspectRatio: 1.3,
                          )),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomTextField(
                        controller: Provider.of<PerformEquationProvider>(
                                context,
                                listen: false)
                            .controllerA,
                        hintText: "mass percent",
                        provider: Provider.of<PerformEquationProvider>(context,
                            listen: false)),
                    CustomTextField(
                        controller: Provider.of<PerformEquationProvider>(
                                context,
                                listen: false)
                            .controllerB,
                        hintText: "atomic percent",
                        provider: Provider.of<PerformEquationProvider>(context,
                            listen: false)),
                    Visibility(
                        visible: Provider.of<PerformEquationProvider>(context)
                                .functionOutput !=
                            null ,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColor.colorA,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Text(
                            "The equation  : f(n) = N*i + M*j ,    where:\n""\n"
                                "N : ${testElement.name} atomic = ${testElement.atomicNumber}\n"
                                "M : ${testElement.name} mass = ${testElement.molarMass}\n"
                                "i : atomic percentage \n"
                                "j : mass percentage\n"
                                .toString(),
                            style: AppStyle.style12,
                            textAlign: TextAlign.justify,
                          ),
                        )),
                    Visibility(
                        visible: Provider.of<PerformEquationProvider>(context)
                                .functionOutput !=
                            null ,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColor.colorA,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Text(
                            "The equation result : ${Provider.of<PerformEquationProvider>(context,
                                listen: false)
                                .functionOutput}"
                                .toString(),
                            style: AppStyle.style12,
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Visibility(
                        visible: elements.isNotEmpty,
                        child: MaterialButton(
                          color: AppColor.defaultColor,
                          onPressed: () {
                            Provider.of<PerformEquationProvider>(context,
                                    listen: false)
                                .onSubmit(
                                    atomic: elements[0].molarMass,
                                    mass: elements[0].atomicNumber.toDouble());
                          },
                          child: const Text(
                            "calculate",
                            style: AppStyle.style16W,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getHeight(int len){
    int l=len~/2;
    if(len<=2){return 140.0;}
    if(len.isEven)
      {return 140*l.toDouble();}
    else{return 140*(l.toDouble()+1);}

  }
}
