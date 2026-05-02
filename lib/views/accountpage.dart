import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/Account/add_phote.dart';
import 'package:e_commerce_clothes/widget/Account/list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final user = snapshot.data;
              return Column(
                children: [
                  SizedBox(height: 40.h),
                  Center(child: AddPhote()),
                  SizedBox(height: 16.h),
                  Text(user?.displayName ?? "", style: AppStyle.mediumStyle),
                  SizedBox(height: 4.h),
                  Text(user?.email ?? "", style: AppStyle.subtitle),
                  SizedBox(height: 40.h),

                  Listtile(
                    leading: Icons.inventory_2_outlined,
                    title: "My Order",
                    onTap: () {
                      goRouter.pushNamed(RouteName.myorderName);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Listtile(
                    leading: Icons.support_agent_rounded,
                    title: "Help Center",
                    onTap: () {
                      goRouter.pushNamed(RouteName.helpCenter);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Listtile(
                    leading: Icons.exit_to_app,
                    title: "Log out",
                    onTap: () async {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Log out',
                        desc: 'Are you sure you want to log out?',
                        btnCancelText: "Cancel",
                        btnOkText: "Yes",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () async {
                          await FirebaseAuth.instance.signOut();

                          goRouter.goNamed(RouteName.onbordingName);
                        },
                      ).show();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
