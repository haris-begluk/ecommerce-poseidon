import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/product.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/widgets/explore_item_details.dart';
import 'package:provider/provider.dart';

class FavoriteItem extends StatelessWidget {
  final WishListItemDetailsDto item;
  final bool favorite;
  const FavoriteItem({
    Key? key,
    required this.item,
    required this.favorite,
  }) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ExploreItemDetailsSreen(
            item: Product(item.product!), favorite: favorite)));
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final products = Provider.of<Products>(context);
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: kBorderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: item.hashCode,
                  child: Image.asset(
                    item.product?.imageUrl ?? FallbackImage,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(maxHeight: 25),
                  icon: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    products.removeProductFromWishList(item.wishListItemId!);
                  },
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 10),
                Text(
                  item.product!.name!.replaceAll("\n", " "),
                  style: kTitleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(item.product!.price as double).toStringAsFixed(2)} KM',
                      style: kTitleStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        minimumSize: Size(15, 15),
                        padding: EdgeInsets.all(7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        cart.addItemByProduct(Product(item.product!));
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added item to cart!',
                            ),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                cart.removeSingleItemByProduct(item.productId!);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
