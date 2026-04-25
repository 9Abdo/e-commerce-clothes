import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountButton extends StatelessWidget {
  const CountButton({super.key, required this.icon,required this.onTap});
  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.w,

      decoration: BoxDecoration(border: BoxBorder.all(color: Colors.grey)),
      child: Center(
        child: GestureDetector(
          onTap:onTap,
          child: Icon(icon, size: 16.sp),
        ),
      ),
    );
  }
}
