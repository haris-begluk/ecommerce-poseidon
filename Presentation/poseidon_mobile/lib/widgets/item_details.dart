import 'package:flutter/material.dart';
import 'package:openapi/common.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/product.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/custom_icon_button.dart';
import 'package:openapi/widgets/quantity_input.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final Product item;
  final num cartItemQuantity;
  final bool favorite;
  final Function(num) callback;
  Details({
    Key? key,
    required this.item,
    required this.favorite,
    required this.cartItemQuantity,
    required this.callback,
  }) : super(key: key);

  @override
  State<Details> createState() =>
      _DetailsState(isFavorite: this.favorite, quantity: this.cartItemQuantity);
}

class _DetailsState extends State<Details> {
  bool? isFavorite;
  num quantity;
  _DetailsState({this.isFavorite, required this.quantity});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context);
    final textController =
        TextEditingController(text: quantity.toStringAsFixed(0));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                truncate(widget.item.name!, 35, addToEnd: '...'),
                style: kTitleStyle.copyWith(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(maxHeight: 36),
                icon: Icon(
                  isFavorite! ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  products.addOrRemoveProductWishList(widget.item.productId!);
                  setState(() {
                    isFavorite = !isFavorite!;
                  });
                },
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            (widget.item.description != null
                ? truncate(rmNewline(widget.item.description!), 35,
                    addToEnd: '...')
                : 'Not Available'),
            style: kDescriptionStyle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              CustomIconButton(
                Icons.remove,
                () {
                  if (quantity > 1) {
                    setState(() {
                      --quantity;
                      widget.callback(quantity);
                      textController.text = quantity.toStringAsFixed(0);
                    });
                  }
                },
                size: 35,
              ),
              SmallQuantityInput(
                textController: textController,
              ),
              CustomIconButton(
                Icons.add,
                () {
                  setState(() {
                    ++quantity;
                    widget.callback(quantity);
                    textController.text = quantity.toStringAsFixed(0);
                  });
                },
                size: 35,
              ),
              Spacer(),
              Text(
                '${widget.item.price!.toStringAsFixed(2)} KM',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(17),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
