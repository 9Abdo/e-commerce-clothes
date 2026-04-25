import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/cartProduct_widget/count_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final String image;
  final String name;
  final double price;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.count,
    required this.onAdd,
    required this.onRemove,
    required this.image,
    required this.name,
    required this.price,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 80.w,
            height: 80.h,
            imageUrl: image,
            placeholder: (context, url) {
              return Container(color: Colors.grey[300]);
            },
            errorWidget: (context, url, error) {
              return Icon(Icons.broken_image, size: 40);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyle.titlecard,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "\$$price",
                  style: AppStyle.titlecard.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CountButton(icon: Icons.remove, onTap: onRemove),
                    SizedBox(width: 8.w),
                    Text("$count"),
                    SizedBox(width: 8.w),
                    CountButton(icon: Icons.add, onTap: onAdd),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
