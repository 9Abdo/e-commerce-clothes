import 'package:e_commerce_clothes/features/favourite/bloc/favourite_bloc.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_state.dart';
import 'package:e_commerce_clothes/widget/mainhome/grideviewcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.favorites.isEmpty) {
          return Center(child: Text("No Favorites Yet ❤️"));
        }

        return Padding(
          padding: EdgeInsets.all(16.sp),
          child: Grideviewcard(clothesmodel: state.favorites),
        );
      },
    );
  }
}
