import 'package:e_commerce_clothes/utils/color.dart';
import 'package:e_commerce_clothes/views/favouritepage.dart';
import 'package:e_commerce_clothes/views/mainhome.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Widget> screen;
  int currentindex = 0;
  @override 
  void initState() {
    super.initState();
    screen = [
      Mainhome(),
      FavoritePage(),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.orange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: currentindex, children: screen),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          currentIndex: currentindex,
          elevation: 0,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.grayColor,
          showSelectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
