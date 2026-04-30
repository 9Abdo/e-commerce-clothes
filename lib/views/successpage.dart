import 'package:e_commerce_clothes/features/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/constimage.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Successpage extends StatelessWidget {
  const Successpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            Image.asset(
              Constimage.successimage,
              width: 200.w,
              fit: BoxFit.fill,
            ),

            SizedBox(height: 20.h),

            Center(
              child: Text(
                "Order Successful 🎉",
                style: AppStyle.appBarStyle,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              "Your order has been placed successfully.\nThank you for shopping!",
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Custombutton(
              buttonName: "Done",
              onPressed: () {
                context.read<CartBloc>().add(ClearCart());
                goRouter.goNamed(RouteName.homeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
