import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_clothes/utils/style.dart';

class OrderItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const OrderItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: ListTile(
        leading: Image.network(
          item['image'],
          width: 60.w,
          height: 60.h,
          fit: BoxFit.cover,
        ),
        title: Text(item['title']),
        subtitle: Text(
          "Quantity: ${item['quantity']}",
          style: AppStyle.subtitle,
        ),
        trailing: Text(
          "\$${item['price']}",
          style: AppStyle.mediumStyle,
        ),
      ),
    );
  }
}