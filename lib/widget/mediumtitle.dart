import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';

class Mediumtitle extends StatelessWidget {
  const Mediumtitle({super.key, required this.mediumTitle});
  final String mediumTitle;

  @override
  Widget build(BuildContext context) {
    return Text(mediumTitle, style: AppStyle.mediumStyle);
  }
}
