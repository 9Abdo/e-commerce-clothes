import 'package:e_commerce_clothes/utils/color.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });
  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        minimumSize: Size(double.infinity, 50.h),
      ),
      onPressed: onPressed,
      child: Text(buttonName, style: AppStyle.buttonStyle),
    );
  }
}
