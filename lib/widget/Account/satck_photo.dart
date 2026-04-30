import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SatckPhoto extends StatelessWidget {
  const SatckPhoto({super.key, required this.onTap, required this.image});
  final void Function()? onTap;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 65.r,
          backgroundImage: image !=  null
              ? FileImage(image!)
              : AssetImage("assets/images/p.jpg") as ImageProvider,
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(Icons.camera_alt, size: 20.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
