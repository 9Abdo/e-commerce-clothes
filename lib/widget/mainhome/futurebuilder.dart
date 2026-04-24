import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/widget/mainhome/grideviewcard.dart';
import 'package:flutter/material.dart';

class Futurebuilder extends StatelessWidget {
  const Futurebuilder({
    super.key,
    required this.future,
    required this.searchtext,
  });
  final Future<List<Clothesmodel>> future;
  final String searchtext;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Clothesmodel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No Data"));
        } else {
          List<Clothesmodel> clothes = snapshot.data!;
          List<Clothesmodel> filteredClothes = clothes.where((item) {
            return item.clothesType.toLowerCase().startsWith(searchtext);
          }).toList();
          if (filteredClothes.isEmpty) {
            return Center(child: Text("No results found"));
          }
          return Grideviewcard(clothesmodel: filteredClothes);
        }
      },
    );
  }
}
