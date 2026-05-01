import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_clothes/utils/style.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help Center", style: AppStyle.appBarStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 Icon (شكل أحلى)
              Center(
                child: Icon(Icons.help_outline, size: 80.sp, color: Colors.grey),
              ),

              SizedBox(height: 16.h),

              Text("Need Help?", style: AppStyle.titleStyle),
              SizedBox(height: 12.h),

              Text(
                "Welcome to our Help Center. We're here to assist you with any issues you may face while using the app.",
                style: AppStyle.subtitle,
              ),

              SizedBox(height: 20.h),

              Text(
                "• You can easily browse and shop through the app.",
                style: AppStyle.subtitle,
              ),
              SizedBox(height: 8.h),

              Text(
                "• To add a product, simply tap on 'Add to Cart'.",
                style: AppStyle.subtitle,
              ),
              SizedBox(height: 8.h),

              Text(
                "• You can track your orders from the 'My Orders' page.",
                style: AppStyle.subtitle,
              ),
              SizedBox(height: 8.h),

              Text(
                "• If you face any issues, feel free to contact our support team.",
                style: AppStyle.subtitle,
              ),

              Spacer(),

              Center(
                child: Text(
                  "Thank you for using our app ❤️",
                  style: AppStyle.subtitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}