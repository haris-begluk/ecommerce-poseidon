import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/product.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/providers/rating.dart';
import 'package:openapi/widgets/explore_item_details.dart';
import 'package:provider/provider.dart';
import 'package:openapi/common.dart';

class ExploreItem extends StatefulWidget {
  final Product item;
  final bool favorite;
  const ExploreItem({
    Key? key,
    required this.item,
    required this.favorite,
  }) : super(key: key);

  @override
  State<ExploreItem> createState() =>
      _ExploreItemState(isFavorite: this.favorite);
}

class _ExploreItemState extends State<ExploreItem> {
  bool? isFavorite;
  _ExploreItemState({this.isFavorite});

  void onTap(BuildContext context) {
    Provider.of<Rating>(context, listen: false)
        .getProductRate(widget.item.productId!)
        .then((value) => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ExploreItemDetailsSreen(
                      item: widget.item, favorite: isFavorite!)))
            });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final product = Provider.of<Products>(context);

    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  tag: widget.item.hashCode,
                  child: Image.asset(
                    widget.item.imageUrl ?? FallbackImage,
                    height: constraints.maxHeight * 0.3,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  truncate(rmNewline(widget.item.name!), 19, addToEnd: '...'),
                  style: kTitleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  truncate(rmNewline(widget.item.description!), 15,
                      addToEnd: '...'),
                  style: kDescriptionStyle,
                ),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(maxHeight: 15),
                  icon: Icon(
                    isFavorite! ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    product.addOrRemoveProductWishList(widget.item.productId!);
                    setState(() {
                      isFavorite = !isFavorite!;
                    });
                  },
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(widget.item.price as double).toStringAsFixed(2)} KM',
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
                        cart.addItemByProduct(widget.item);
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
                                cart.removeSingleItemByProduct(
                                    widget.item.productId!);
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
