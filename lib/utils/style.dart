import 'package:e_commerce_clothes/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle titleStyle = TextStyle(
    fontSize: 32.sp,
    color: AppColor.titleColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
  );
  static TextStyle buttonStyle = TextStyle(
    fontSize: 16.sp,
    color: AppColor.whiteColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mediumStyle = TextStyle(
    fontSize: 16.sp,
    color: AppColor.titleColor,
    fontWeight: FontWeight.w500,
  );
 static TextStyle pricesubtitle = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey[500],
    fontWeight: FontWeight.w500,
  );
  static TextStyle appBarStyle = TextStyle(
    fontSize: 24.sp,
    color: AppColor.titleColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle titlecard = TextStyle(
    fontSize: 14.sp,
    color: AppColor.titleColor,
    fontWeight: FontWeight.w600,
  );
   
}
