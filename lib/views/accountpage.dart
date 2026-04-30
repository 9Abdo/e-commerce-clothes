import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/Account/add_phote.dart';
import 'package:e_commerce_clothes/widget/Account/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Account", style: AppStyle.appBarStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Center(child: AddPhote()),
              SizedBox(height: 32.h),
              Listtile(
                leading: Icons.account_circle,
                title: "My Account",
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              Listtile(
                leading: Icons.settings,
                title: "My Order",
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              Listtile(
                leading: Icons.support_agent_rounded,
                title: "Supports",
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              Listtile(
                leading: Icons.exit_to_app,
                title: "Log out",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
