import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListtileOrder extends StatelessWidget {
  const ListtileOrder({
    super.key,
    required this.orderId,
    required this.total,
    required this.status,
    required this.onTap,
  });
  final String orderId;
  final double total;
  final String status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          title: Text(
            "Order #${orderId.substring(0, 6)}",
            style: AppStyle.mediumStyle,
          ),
          subtitle: Text(
            "Total: \$${total.toStringAsFixed(2)}",
            style: AppStyle.subtitle,
          ),
          trailing: Text(status),
          onTap: onTap,
        ),
      ),
    );
  }
}
