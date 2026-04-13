import 'package:flutter/material.dart';
import 'package:e_commerce_clothes/widget/mainhome/grideviewcard.dart';
import 'package:e_commerce_clothes/helper/favorite_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: ValueListenableBuilder(
        valueListenable: FavoriteManager.favoritesNotifier,
        builder: (context, value, child) {
          final favClothes = FavoriteManager.getFavorites();

          if (favClothes.isEmpty) {
            return Center(child: Text("No Favorites Yet ❤️"));
          }

          return Grideviewcard(clothesmodel: favClothes);
        },
      ),
    );
  }
}
