import 'package:flutter/material.dart';
import 'package:openapi/screens/cart_screen.dart';
import 'package:openapi/screens/explore_tab_screen.dart';
import 'package:openapi/screens/explore_screen.dart';
import 'package:openapi/screens/offer_screen.dart';
import 'package:openapi/screens/orders_screen.dart';
import 'package:openapi/screens/signup_screen.dart';
import 'package:openapi/screens/tab_screen.dart';
import 'package:openapi/screens/user_tab_screen.dart';

class Route {
  Map<String, Widget Function(BuildContext)> routes = {
    CartScreen.routeName: (ctx) => CartScreen(),
    ExploreScreen.routeName: (ctx) => ExploreScreen(),
    ExploreOverviewScreen.routeName: (ctx) => ExploreOverviewScreen(),
    UserScreen.routeName: (ctx) => UserScreen(),
    SignupScreen.routeName: (ctx) => SignupScreen(),
    TabScreen.routeName: (ctx) => TabScreen(),
    OrderScreen.routeName: (ctx) => OrderScreen(),
    OfferScreen.routeName: (ctx) => OfferScreen(),
  };
}
