import 'package:e_commerce_clothes/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Containericon extends StatelessWidget {
  const Containericon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: AppColor.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                );
  }
}