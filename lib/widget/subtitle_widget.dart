import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(subtitle, style: AppStyle.subtitle);
  }
}
