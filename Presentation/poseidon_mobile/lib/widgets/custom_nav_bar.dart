import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';

class CustomNavBar extends StatefulWidget {
  final int curTabIndex;
  final Function(int) onTap;
  CustomNavBar(this.onTap, this.curTabIndex);
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (tabIndex) {
        widget.onTap(tabIndex);
      },
      selectedItemColor: kPrimaryGreen,
      unselectedItemColor: kGreyShade2,
      currentIndex: widget.curTabIndex,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 0
              ? Image.asset(
                  'assets/images/ui/home_nav.png',
                )
              : Image.asset(
                  'assets/images/ui/home_nav_notfill.png',
                ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 1
              ? Image.asset(
                  'assets/images/ui/explore_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/ui/explore_nav.png',
                ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 2
              ? Image.asset(
                  'assets/images/ui/heart_fill.png',
                )
              : Image.asset(
                  'assets/images/ui/heart.png',
                ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 3
              ? Image.asset(
                  'assets/images/ui/cart_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/ui/cart_nav.png',
                ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 4
              ? Image.asset(
                  'assets/images/ui/profile_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/ui/user_nav.png',
                ),
          label: 'Profile',
        ),
      ],
    );
  }
}
