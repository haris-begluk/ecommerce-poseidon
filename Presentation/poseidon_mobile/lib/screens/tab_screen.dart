import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/user.dart';
import 'package:openapi/screens/cart_screen.dart';
import 'package:openapi/screens/explore_tab_screen.dart';
import 'package:openapi/screens/favorite_tab_screen.dart';
import 'package:openapi/screens/home_tab_screen.dart';
import 'package:openapi/screens/user_tab_screen.dart';
import 'package:openapi/widgets/custom_nav_bar.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabScreen';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int curTab = 0;
  @override
  void initState() {
    Provider.of<User>(context, listen: false).loadUserDetails();
    Provider.of<Cart>(context, listen: false).loadActiveCartOrCreate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    List<Map<String, Widget>> pages = [
      {
        'widget': HomeScreen(),
      },
      {
        'widget': ExploreOverviewScreen(),
      },
      {
        'widget': FavoriteScreen(),
      },
      {
        'widget': CartScreen(),
      },
      {
        'widget': UserScreen(),
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MQuery.height,
          width: MQuery.width,
          child: SingleChildScrollView(
            child: pages[curTab]['widget']!,
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar((index) {
        setState(() {
          curTab = index;
        });
      }, curTab),
    );
  }
}
