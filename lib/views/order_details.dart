import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/order_details/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final items = order['items'] as List;

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details", style: AppStyle.appBarStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: ${order['id']}", style: AppStyle.mediumStyle),
            SizedBox(height: 10.h),

            Text("Status: ${order['status']}"),
            SizedBox(height: 10.h),

            Text("Total: \$${order['total']}", style: AppStyle.mediumStyle),
            SizedBox(height: 20.h),

            Text("Items:", style: AppStyle.titleStyle),
            SizedBox(height: 10.h),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return OrderItemCard(item: item[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
