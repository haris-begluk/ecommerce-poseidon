import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/product.dart';
import 'package:openapi/providers/rating.dart';
import 'package:openapi/widgets/item_details.dart';
import 'package:openapi/widgets/item_expandable.dart';
import 'package:openapi/widgets/item_header.dart';
import 'package:openapi/widgets/round_button.dart';
import 'package:provider/provider.dart';

class ExploreItemDetailsSreen extends StatefulWidget {
  static const routeName = 'item-details-screen/';
  final Product item;
  final bool favorite;

  const ExploreItemDetailsSreen({
    Key? key,
    required this.item,
    required this.favorite,
  }) : super(key: key);

  @override
  State<ExploreItemDetailsSreen> createState() =>
      _ExploreItemDetailsSreenState();
}

class _ExploreItemDetailsSreenState extends State<ExploreItemDetailsSreen> {
  num quantity = 1;

  callback(num value) {
    setState(() {
      quantity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final rate = Provider.of<Rating>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: widget.item),
              Details(
                  item: widget.item,
                  favorite: widget.favorite,
                  cartItemQuantity: cart.getItemQuantity(widget.item),
                  callback: callback),
              SizedBox(height: 15),
              Divider(color: kBorderColor),
              Expandable(
                title: 'Description',
                description: widget.item.description,
              ),
              Divider(color: kBorderColor, indent: 15, endIndent: 15),
              Expandable(
                title: 'Details',
                description:
                    'GTIN: ${widget.item.gtin} Product number: ${widget.item.number}',
              ),
              Divider(color: kBorderColor, indent: 15, endIndent: 15),
              Expandable(
                  title: 'Reviews',
                  description: 'Rate our product',
                  trailing: RatingBar.builder(
                    initialRating: (rate.productRate?.rating ?? 0).toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {
                      rate.postProductReview(widget.item.productId!, value);
                    },
                  )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  title: 'Update cart',
                  onTap: () {
                    cart.updateItemByProduct(widget.item, quantity: quantity);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Cart updated',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
