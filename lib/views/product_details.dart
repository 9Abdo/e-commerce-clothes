import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.clothesModel});
  final Clothesmodel clothesModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details", style: AppStyle.appBarStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(24.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: clothesModel.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 12.h),
                Text(clothesModel.clothesType, style: AppStyle.appBarStyle),
                SizedBox(height: 13.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Text(" 4.0/5", style: AppStyle.mediumStyle),
                  ],
                ),
                Text(clothesModel.description, style: AppStyle.subtitle),
                SizedBox(height: 16.h),
                SizedBox(width: double.infinity, child: Divider()),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Price", style: AppStyle.subtitle),
                        Text(
                          r'$'
                          "${clothesModel.price}",
                          style: AppStyle.appBarStyle,
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Custombutton(
                        buttonName: "Add to Card",
                        onPressed: () {
                          context.read<CartBloc>().add(AddToCart(clothesModel));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
