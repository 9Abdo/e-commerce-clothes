import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/widget/mainhome/card_product.dart';
import 'package:flutter/material.dart';

class Grideviewcard extends StatelessWidget {
  const Grideviewcard({super.key, required this.clothesmodel});
  final List<Clothesmodel> clothesmodel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: clothesmodel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .65,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        
      ),
      itemBuilder: (context, index) {
        return CardProduct(clothesModel: clothesmodel[index],);
      },
    );
  }
}
