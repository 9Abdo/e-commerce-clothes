import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });
  final IconData leading;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Icon(leading),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
