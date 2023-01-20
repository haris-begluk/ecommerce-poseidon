import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/close_button.dart';
import 'package:openapi/widgets/custom_icon_button.dart';
import 'package:openapi/widgets/quantity_input.dart';
import 'package:openapi/common.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartListItem extends StatefulWidget {
  final int cartItemId;
  final int productId;
  final num price;
  final num quantity;
  final num? discountAmount;
  final num? taxAmount;
  final String title;
  final String unit;
  final String? imageUrl;
  CartListItem({
    Key? key,
    required this.cartItemId,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.discountAmount,
    required this.taxAmount,
    required this.title,
    required this.unit,
    this.imageUrl,
    this.isSelected = false,
    this.onTapHandler,
  }) : super(key: key);

  final bool isSelected;
  final Function()? onTapHandler;
  @override
  CartListItemState createState() => CartListItemState();
}

class CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(
      text: widget.quantity.toStringAsFixed(0),
    );
    final cart = Provider.of<Cart>(context);
    return Container(
      height: getProportionateScreenHeight(120),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: kGreyShade5),
        ),
      ),
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(8.0),
        bottom: getProportionateScreenWidth(15.0),
        left: getProportionateScreenWidth(6.0),
        right: getProportionateScreenWidth(6.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: getProportionateScreenWidth(80),
            child: Image.asset(widget.imageUrl ?? FallbackImage,
                height: getProportionateScreenWidth(80),
                width: getProportionateScreenWidth(80),
                fit: BoxFit.fitWidth),
            decoration: ShapeDecoration(
              color: kPrimaryWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    truncate(widget.title, 30, addToEnd: "..."),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                  ),
                  Spacer(),
                  CustomCloseButton(
                      onPress: () {
                        cart.removeFromCart(widget.cartItemId);
                      },
                      size: 32)
                ]),
                Row(children: [
                  Text(
                    'Discount: ${widget.discountAmount ?? 0} KM',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                  ),
                  Spacer(),
                  Text(
                    'Tax: ${widget.taxAmount ?? 0} KM',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                  ),
                  Spacer(),
                  Text(
                    'Unit: ${widget.unit}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                  ),
                ]),
                Row(
                  children: [
                    CustomIconButton(
                      Icons.remove,
                      () {
                        textController.text =
                            widget.quantity.toStringAsFixed(0);
                        cart.decreaseOrRemove(widget.cartItemId);
                      },
                      size: 32,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(4),
                    ),
                    SmallQuantityInput(
                      textController: textController,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(4),
                    ),
                    CustomIconButton(
                      Icons.add,
                      () {
                        textController.text =
                            widget.quantity.toStringAsFixed(0);
                        cart.increaseQuantityCartItem(widget.cartItemId);
                      },
                      size: 32,
                    ),
                    Spacer(),
                    Text(
                      '${widget.price.toStringAsFixed(2)} KM',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(17),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    // );
  }
}
