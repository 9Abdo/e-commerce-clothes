import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_bloc.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_event.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_state.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key, required this.clothesModel});
  final Clothesmodel clothesModel;

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFav = state.isFavorite(widget.clothesModel.id);
        return GestureDetector(
          onTap: () {
            goRouter.pushNamed(
              RouteName.productdetailsName,
              extra: widget.clothesModel,
            );
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    width: 161.w,
                    height: 174.h,
                    fit: BoxFit.cover,
                    imageUrl: widget.clothesModel.image,
                    memCacheHeight: 200,
                    memCacheWidth: 200,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[300]),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.broken_image, size: 40),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.clothesModel.clothesType.length > 12
                      ? widget.clothesModel.clothesType.substring(0, 12)
                      : widget.clothesModel.clothesType,
                  style: AppStyle.mediumStyle,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$'
                      "${widget.clothesModel.price}",
                      style: AppStyle.pricesubtitle,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<FavoriteBloc>().add(
                          ToggleFavorite(widget.clothesModel),
                        );
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
