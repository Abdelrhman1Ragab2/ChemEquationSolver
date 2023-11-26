import 'package:equation/core/utils/app_color.dart';
import 'package:flutter/material.dart';





void showSnackBar({required BuildContext context, required String message,required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      elevation: 50,
      backgroundColor: color,

    ),
  );
}
