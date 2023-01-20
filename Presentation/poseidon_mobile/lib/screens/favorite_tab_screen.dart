import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/favorite_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorite';

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteScreen> {
  Timer? _debounce;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<Products>(context, listen: false).getWishListForUser());
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    final productProvider = Provider.of<Products>(context);
    return Container(
      height: MQuery.height - 80,
      child: Column(
        children: [
          Center(
            child: Card(
              child: SizedBox(
                width: getProportionateScreenWidth(375),
                height: 50,
                child: Center(
                    child: Text(
                  productProvider.wishList?.wishListItem!.length == 0
                      ? 'Your wish list is empty'
                      : 'Your favorite products',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                      ),
                )),
              ),
            ),
          ),
          SizedBox(height: 10),
          if (productProvider.wishList?.wishListItem != null)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: productProvider.wishList!.wishListItem!.length,
                itemBuilder: (_, i) => FavoriteItem(
                    item: productProvider.wishList!.wishListItem![i],
                    favorite: true),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.56 / 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            )
        ],
      ),
    );
  }
}
