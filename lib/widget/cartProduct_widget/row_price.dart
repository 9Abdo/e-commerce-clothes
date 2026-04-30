import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({
    super.key,
    required this.title,
    required this.value,
    this.isTotal = false,
  });
  final String title;
  final bool isTotal;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isTotal ? AppStyle.mediumStyle : AppStyle.pricesubtitle,
          ),
          Text("\$ ${value.toStringAsFixed(2)}", style: AppStyle.mediumStyle),
        ],
      ),
    );
  }
}
