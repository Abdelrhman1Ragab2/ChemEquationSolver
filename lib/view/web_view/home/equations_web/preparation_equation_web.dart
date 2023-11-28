import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:equation/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/element.dart';
import '../periodic_table_web/element_list_view.dart';
import '../periodic_table_web/periodic_table_web.dart';

class PreparationEquationWebView extends StatefulWidget {
  const PreparationEquationWebView({Key? key}) : super(key: key);

  @override
  State<PreparationEquationWebView> createState() =>
      _PreparationEquationWebViewState();
}

class _PreparationEquationWebViewState
    extends State<PreparationEquationWebView> {
  late PerformEquationProvider _performEquationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _performEquationProvider =
        Provider.of<PerformEquationProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();

    _performEquationProvider.resetPrepareEquation();
  }

  @override
  Widget build(BuildContext context) {
    List<ElementModel>elements=prepareElement(); // get element the user will select it ,init is empty
    return Scaffold(body: buildBody(context, elements));
  }

  Widget buildBody(BuildContext context, List<ElementModel> elements) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: Provider.of<PerformEquationProvider>(context, listen: false)
            .formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildElementBody(elements),
                  buildAddElementButtonBody(context, elements),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: buildTextFieldsAreaBody(context, elements)),
          ],
        ),
      ),
    );
  }

  Widget buildElementBody(List<ElementModel> elements) {
    return Container(
        height: 350,
        padding: const EdgeInsets.all(8.0),
        child: elements.isEmpty
            ? const Text(
                "Please add an element ",
                style: AppStyle.style18,
              )
            : ElementsListViewWeb(
                inTable: false,
                elements: elements,
              ));
  }

  Widget buildAddElementButtonBody(
      BuildContext context, List<ElementModel> elements) {
    return Visibility(
      visible: true,
      child: MaterialButton(
        color: AppColor.colorA,
        onPressed: () {
          Provider.of<PerformEquationProvider>(context,listen: false).updatePrepareEquation();
          Navigator.pushNamed(context, PeriodicTableWeb.routeName);
        },
        child: const Text(
          "Add element",
          style: AppStyle.style16W,
        ),
      ),
    );
  }

  Widget buildTextFieldsAreaBody(
      BuildContext context, List<ElementModel> elements) {
    return Visibility(
      visible: elements.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.colorA,
              ),
              height: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Enter the following parameters",
                )),
            CustomTextField(
                controller:
                    Provider.of<PerformEquationProvider>(context, listen: false)
                        .controllerA,
                hintText: "Mass",
                provider: Provider.of<PerformEquationProvider>(context,
                    listen: false)),
            CustomTextField(
                controller:
                    Provider.of<PerformEquationProvider>(context, listen: false)
                        .controllerB,
                hintText: "Volume (mL)",
                provider: Provider.of<PerformEquationProvider>(context,
                    listen: false)),
            Visibility(
                visible: Provider.of<PerformEquationProvider>(context)
                        .functionOutput !=
                    null,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColor.colorD,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "The equation result : ${Provider.of<PerformEquationProvider>(context, listen: false).functionOutput}"
                        .toString(),
                    style: AppStyle.style16,
                    textAlign: TextAlign.center,
                  ),
                )),
            Visibility(
                visible: Provider.of<PerformEquationProvider>(context)
                        .isError ,// the element has one element is fake for title
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColor.errorMessage,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    Provider.of<PerformEquationProvider>(context, listen: false).errorMessage
                        .toString(),
                    style: AppStyle.lato16,
                    textAlign: TextAlign.center,
                  ),
                )),
            MaterialButton(
              color: AppColor.colorA,
              onPressed: () {
                Provider.of<PerformEquationProvider>(context, listen: false)
                    .onSubmit();
              },
              child: const Text(
                "Calculate",
                style: AppStyle.style16W,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ElementModel>prepareElement(){
    List<ElementModel> elements =[];
    elements.insert(0, ElementModel(
        id: "id",
        name: "name",
        atomicNumber: 010,
        code: "Symbol",
        molarMass: 010,
        group: 010,
        period: 010));
    elements.addAll(Provider.of<PerformEquationProvider>(context).activeElements);
    return elements;
  }
}
