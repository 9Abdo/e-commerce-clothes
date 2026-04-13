import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required String snack,
  required Color color,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      content: Text(snack, style: TextStyle(fontSize: 18, ),),
      backgroundColor: color,
    ),
  );
}
