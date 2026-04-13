import 'package:e_commerce_clothes/utils/color.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.icon,
    this.obscuretext = false,
    this.validator,
    required this.textEditingController, this.prefxicon, this.onChanged,
  });
  final String hint;
  final IconButton? icon;
  final bool obscuretext;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  final IconButton? prefxicon;
 final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
      validator: validator,
      obscureText: obscuretext,
      controller: textEditingController,
      onChanged: onChanged,

      cursorColor: AppColor.grayColor,
      decoration: InputDecoration(
        
        hint: Text(hint, style: AppStyle.subtitle),
        suffixIcon: icon,
        prefixIcon:prefxicon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey, width: 1.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey, width: 1.sp),
        ),
      ),
    );
  }
}
