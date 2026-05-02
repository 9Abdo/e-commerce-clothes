import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/route/const_route.dart';
import 'package:e_commerce_clothes/views/help_center.dart';
import 'package:e_commerce_clothes/views/homepage.dart';
import 'package:e_commerce_clothes/views/loginpage.dart';
import 'package:e_commerce_clothes/views/myorderpage.dart';
import 'package:e_commerce_clothes/views/onbording.dart';
import 'package:e_commerce_clothes/views/order_details.dart';
import 'package:e_commerce_clothes/views/product_details.dart';
import 'package:e_commerce_clothes/views/registerpage.dart';
import 'package:e_commerce_clothes/views/successpage.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutePath.onbordingPath,

  routes: [
    GoRoute(
      path: RoutePath.onbordingPath,
      name: RouteName.onbordingName,
      builder: (context, state) {
        return Onbording();
      },
    ),
    GoRoute(
      path: RoutePath.loginPath,
      name: RouteName.loginName,
      builder: (context, state) {
        return Loginpage();
      },
    ),
    GoRoute(
      path: RoutePath.registerPath,
      name: RouteName.registerName,
      builder: (context, state) {
        return Registerpage();
      },
    ),
    GoRoute(
      path: RoutePath.homePath,
      name: RouteName.homeName,
      builder: (context, state) {
        return Homepage();
      },
    ),
    GoRoute(
      path: RoutePath.productdetailsPath,
      name: RouteName.productdetailsName,
      builder: (context, state) {
        Clothesmodel clothesmodel = state.extra as Clothesmodel;
        return ProductDetails(clothesModel: clothesmodel);
      },
    ),
    GoRoute(
      path: RoutePath.successPath,
      name: RouteName.successName,
      builder: (context, state) {
        return Successpage();
      },
    ),
    GoRoute(
      path: RoutePath.helpcenter,
      name: RouteName.helpCenter,
      builder: (context, state) {
        return HelpCenter();
      },
    ),
    GoRoute(
      path: RoutePath.myorderPath,
      name: RouteName.myorderName,
      builder: (context, state) {
        return Myorderpage();
      },
    ),
    GoRoute(
      path: RoutePath.orderdetailsPath,
      name: RouteName.orderdetailsName,
      builder: (context, state) {
        final order = state.extra as Map<String, dynamic>;
        return OrderDetails(order:order,);
      },
    ),
  ],
);
