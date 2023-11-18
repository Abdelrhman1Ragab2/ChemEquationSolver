
import 'package:equation/controller/provider/perform_equation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final PerformEquationProvider provider;
  const CustomTextField({Key? key,required this.controller,required this.hintText,required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
          controller: controller,
            validator: (val) {
              if (val != null) {
                if (val.isEmpty) {
                  return "value can not be empty";
                }
              }
            },
          decoration: InputDecoration(
            label: Text(hintText),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black,width: 1)
            )
          ),
      ),
    );
  }
}
