import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/common.dart';

class OrderItem extends StatefulWidget {
  final OrderDto order;
  OrderItem({
    Key? key,
    required this.isSelected,
    this.onTapHandler,
    required this.order,
  }) : super(key: key);

  final bool isSelected;
  final Function()? onTapHandler;
  @override
  OrderItemState createState() => OrderItemState();
}

class OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Order>(context);
    return Container(
      height: getProportionateScreenHeight(270),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: kGreyShade1),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order number: ${widget.order.orderId ?? 0}',
                  style: kDescriptionStyle2,
                ),
                Text(
                  truncate(widget.order.description ?? '', 38, addToEnd: ''),
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Product doscount amount: ${widget.order.productDiscountAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Product tax amount: ${widget.order.productTaxAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Order tax amount: ${widget.order.orderTaxAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Order discount amount: ${widget.order.orderTaxAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Shipping fee amount: ${widget.order.shippingFeeAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Shipping method: ${widget.order.shippingMethod ?? ''}',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Payment fee amount: ${widget.order.paymentFeeAmount ?? ''} KM',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Payment method: ${widget.order.paymentMethod ?? ''}',
                  style: kDescriptionStyle2,
                ),
                Spacer(),
                Text(
                  'Total: ${widget.order.orderTotal ?? ''} KM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
