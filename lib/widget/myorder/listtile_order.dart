import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListtileOrder extends StatelessWidget {
  final Map<String, dynamic> order;

  const ListtileOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          title: Text(
            "Order #${order['id'].toString().substring(0, 6)}",
            style: AppStyle.mediumStyle,
          ),
          subtitle: Text(
            "Total: \$${order['total']}",
            style: AppStyle.subtitle,
          ),
          trailing: Text(order['status']),
          onTap: () {
            goRouter.pushNamed(
              RouteName.orderdetailsName,
              extra: order,
            );
          },
        ),
      ),
    );
  }
}