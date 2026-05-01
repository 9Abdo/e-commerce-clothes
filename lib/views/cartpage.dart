import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_state.dart';
import 'package:e_commerce_clothes/route/approute.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/utils/style.dart';
import 'package:e_commerce_clothes/widget/cartProduct_widget/card_item.dart';
import 'package:e_commerce_clothes/widget/cartProduct_widget/row_price.dart';
import 'package:e_commerce_clothes/widget/custombutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int countProduct = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart", style: AppStyle.appBarStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.items.isEmpty) {
                return Center(child: Text("Cart is empty 🛒"));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: CartItem(
                            count: item.quantity,
                            onAdd: () {
                              context.read<CartBloc>().add(
                                IncreaseQuantity(item.clothesmodel),
                              );
                            },
                            onRemove: () {
                              context.read<CartBloc>().add(
                                DecreaseQuantity(item.clothesmodel),
                              );
                            },
                            onDelete: () {
                              context.read<CartBloc>().add(
                                RemoveFromCart(item.clothesmodel),
                              );
                            },
                            image: item.clothesmodel.image,
                            name: item.clothesmodel.clothesType,
                            price: item.clothesmodel.price,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      children: [
                        RowPrice(title: "Sub-total", value: state.total),
                        RowPrice(title: "VAT (0%)", value: 0),
                        RowPrice(title: "Shipping fee", value: 80),
                        Divider(),
                        RowPrice(
                          title: "Total",
                          value: state.total + 80,
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Custombutton(
                    buttonName: "Go To Checkout →",
                    onPressed: () async {
                      final state = context.read<CartBloc>().state;
                      final userId = FirebaseAuth.instance.currentUser!.uid;

                      final order = {
                        "total": state.total,
                        "status": "Pending",
                        "date": DateTime.now(),
                        "items": state.items
                            .map(
                              (e) => {
                                "id": e.clothesmodel.id,
                                "title": e.clothesmodel.clothesType,
                                "price": e.clothesmodel.price,
                                "image": e.clothesmodel.image,
                                "quantity": e.quantity,
                              },
                            )
                            .toList(),
                      };

                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(userId)
                          .collection("orders")
                          .add(order);

                      context.read<CartBloc>().add(ClearCart());
                      goRouter.pushReplacementNamed(RouteName.successName);
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
