import 'package:dio/dio.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/services/clothes_services.dart';
import 'package:e_commerce_clothes/widget/custom_text_form_field.dart';
import 'package:e_commerce_clothes/widget/mainhome/containericon.dart';
import 'package:e_commerce_clothes/widget/mainhome/futurebuilder.dart';
import 'package:e_commerce_clothes/widget/title_widet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}





class _MainhomeState extends State<Mainhome> {
  String searchText = "";
  TextEditingController search = TextEditingController();
  late Future<List<Clothesmodel>> clothesFuture;
  @override
  void initState() {
    super.initState();
    clothesFuture = ClothesServices(Dio()).getClothes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidet(title: "Discover"),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hint: "Search for Clothes...",
                    textEditingController: search,
                    onChanged: (value) {
                      setState(() {
                        searchText = value.toLowerCase();
                      });
                    },
                    prefxicon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Containericon(),
              ],
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: Futurebuilder(
                future: clothesFuture,
                searchtext: searchText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
