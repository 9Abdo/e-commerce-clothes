import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';

class TitleWidet extends StatelessWidget {
  const TitleWidet({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppStyle.titleStyle);
  }
}
