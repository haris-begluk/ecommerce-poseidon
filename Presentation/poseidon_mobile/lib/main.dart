import 'package:flutter/material.dart';
import 'package:openapi/environmet.dart';
import 'package:openapi/providers/auth.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/order.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/providers/checkout.dart';
import 'package:openapi/providers/rating.dart';
import 'package:openapi/providers/user.dart';
import 'package:openapi/screens/tab_screen.dart';
import 'package:openapi/utils/custom_theme.dart';
import 'package:provider/provider.dart';
import './routes/route.dart' as route;
import 'providers/filter.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  const String baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: '10.0.2.2',
  );
  Environment().initConfig(baseUrl);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Filter(),
        ),
        ChangeNotifierProxyProvider<Auth, User>(
          create: (ctx) => User(Auth(), null),
          update: (ctx, auth, userDetails) => User(auth, userDetails),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products(Auth(), []),
          update: (ctx, auth, loadedProducts) => Products(
            auth,
            loadedProducts == null ? [] : loadedProducts.items,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Rating>(
          create: (ctx) => Rating(Auth(), null),
          update: (ctx, auth, rate) => Rating(auth, rate?.productRate),
        ),
        ChangeNotifierProxyProvider<Auth, Cart>(
          create: (ctx) => Cart(Auth(), []),
          update: (ctx, auth, cart) => Cart(auth, cart!.items),
        ),
        ChangeNotifierProxyProvider<Auth, Order>(
          create: (ctx) => Order(Auth(), null),
          update: (ctx, auth, order) => Order(auth, order?.order),
        ),
        ChangeNotifierProxyProvider<Auth, Checkout>(
          create: (ctx) => Checkout(Auth(), null, null, [], []),
          update: (ctx, auth, checkout) => Checkout(
              auth,
              checkout!.deliveryId,
              checkout.creditCardId,
              checkout.deliveryItems,
              checkout.creditCards),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) {
          final customTheme = CustomTheme();
          return MaterialApp(
            title: 'Poseidon Shop',
            theme: ThemeData(
              primarySwatch: Colors.green,
              textTheme: customTheme.nunito(),
              elevatedButtonTheme: customTheme.elevatedButtonTheme(),
              outlinedButtonTheme: customTheme.outlinedButtonTheme(),
              textButtonTheme: customTheme.textButtonTheme(),
              dividerTheme: customTheme.dividerTheme(),
            ),
            home: auth.isAuth
                ? TabScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                  ),
            routes: route.Route().routes,
          );
        },
      ),
    );
  }
}
