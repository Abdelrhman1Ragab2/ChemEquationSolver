import 'package:equation/controller/provider/element_provider.dart';
import 'package:equation/controller/provider/perform_equation.dart';
import 'package:equation/core/utils/app_color.dart';
import 'package:equation/core/utils/style.dart';
import 'package:equation/core/widget/custom_text_field.dart';
import 'package:equation/view/web_view/home/periodic_table_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/element.dart';
import '../../mobile_view/periodic_table/elements_grid_view.dart';
import '../../mobile_view/periodic_table/periodic_table_view.dart';

class PreparationEquationWebView extends StatefulWidget {
  const PreparationEquationWebView({Key? key}) : super(key: key);

  @override
  State<PreparationEquationWebView> createState() => _PreparationEquationWebViewState();
}

class _PreparationEquationWebViewState extends State<PreparationEquationWebView> {
  late PerformEquationProvider _performEquationProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _performEquationProvider = Provider.of<PerformEquationProvider>(context, listen: false);

  }

  @override
  void dispose() {
    super.dispose();

    _performEquationProvider.resetPrepareEquation();
  }

  @override
  Widget build(BuildContext context) {
    List<ElementModel> elements =
        Provider.of<PerformEquationProvider>(context).activeElements;
    return Scaffold(
        body: buildBody(context, elements));
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
        height: 230,
        padding: const EdgeInsets.all(8.0),
        child: elements.isEmpty
            ? const Text(
          "Please add an element ",
          style: AppStyle.style18,
        )
            : ElementsGridView(
          elements: elements,
          crossCount: 2,
          inTable: false,
          aspectRatio: 1.3,
        ));
  }

  Widget buildAddElementButtonBody(
      BuildContext context, List<ElementModel> elements) {
    return Visibility(
      visible: elements.isEmpty,
      child: MaterialButton(
        color: AppColor.colorC,
        onPressed: () {
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
            // Visibility(
            //     visible: Provider.of<PerformEquationProvider>(context)
            //         .functionOutput !=
            //         null ,
            //     child: Container(
            //       margin: const EdgeInsets.all(8),
            //       width: double.maxFinite,
            //       padding: const EdgeInsets.all(20),
            //       decoration: BoxDecoration(
            //           color: AppColor.colorA,
            //           borderRadius: BorderRadius.circular(16),
            //           border: Border.all(color: Colors.black,width: 1)
            //       ),
            //       child: Text(
            //         "The equation  : m = M * Mvt * v(mL)/1000 ,    where:\n""\n"
            //             "m : unknown weight \n"
            //             "M : moles \n"
            //             "Mvt : part weight \n"
            //             "v : solution \n"
            //             .toString(),
            //         style: AppStyle.style12,
            //         textAlign: TextAlign.justify,
            //       ),
            //     )),
            Visibility(
                visible: Provider.of<PerformEquationProvider>(context)
                    .functionOutput !=
                    null,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColor.colorA,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "The equation result : ${Provider.of<PerformEquationProvider>(context, listen: false).functionOutput}"
                        .toString(),
                    style: AppStyle.style12,
                    textAlign: TextAlign.center,
                  ),
                )),
            MaterialButton(
              color: AppColor.colorC,
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

  double getHeight(int len) {
    int l = len ~/ 2;
    if (len <= 2) {
      return 140.0;
    }
    if (len.isEven) {
      return 140 * l.toDouble();
    } else {
      return 140 * (l.toDouble() + 1);
    }
  }

  double getHeight1(int len) {
    if (len == 0) {
      return 90;
    }
    if (len > 3) {
      return 260;
    }
    return len * 90;
  }
}
