import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/constimage.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24.sp),
          child: ListView(
            children: [
              SizedBox(height: 120.h),
              Center(
                child: Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Constimage.onbordingimage),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(child: Text("Welcome", style: AppStyle.titleStyle)),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  "Discover the latest fashion trends and shop your favourite clothes easily",
                  style: AppStyle.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 100.h),
              Custombutton(
                buttonName: "Login",
                onPressed: () {
                  goRouter.pushReplacementNamed(RouteName.loginName);
                },
              ),
              SizedBox(height: 16.h),
              Custombutton(
                buttonName: "signup",
                onPressed: () {
                  goRouter.pushReplacementNamed(RouteName.registerName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
