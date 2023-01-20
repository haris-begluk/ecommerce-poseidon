import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/common.dart';
import 'package:openapi/providers/checkout.dart';
import 'package:openapi/providers/order.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatefulWidget {
  final String title;
  final String? secTitle;
  final Function()? tapHandler;
  final bool expandable;
  const CheckoutCard(
      {Key? key,
      required this.title,
      required this.secTitle,
      this.tapHandler,
      this.expandable = true})
      : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard>
    with SingleTickerProviderStateMixin {
  late bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> checkoutWidgets = {
      'Delivery': OrderDelivery(),
      'Payment': OrderPayment(),
      'Details': OrderDetails(),
    };
    return GestureDetector(
      onTap: widget.tapHandler,
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: kShadowColor.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(20.0),
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    widget.secTitle ?? '',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                InkWell(
                  child: RotatedBox(
                    quarterTurns: _expanded ? 3 : 0,
                    child: Icon(Icons.chevron_right),
                  ),
                  onTap: () => setState(() => {
                        if (widget.expandable) {_expanded = !_expanded}
                      }),
                ),
              ],
            ),
            AnimatedSize(
              alignment: Alignment.centerLeft,
              duration: Duration(milliseconds: 200),
              child: ConstrainedBox(
                  constraints: _expanded && widget.expandable
                      ? BoxConstraints()
                      : BoxConstraints(maxHeight: 0),
                  child: checkoutWidgets[widget.title]),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPayment extends StatefulWidget {
  @override
  State<OrderPayment> createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
  CreditCardDto? selectedCard;

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<Checkout>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              checkout.creditCards != null && checkout.creditCards!.length != 0
                  ? DropdownButton<CreditCardDto>(
                      hint: Text('Select credit card'),
                      value: selectedCard,
                      icon: Icon(
                        Icons.credit_card,
                      ),
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      underline: Container(
                        height: 2,
                        color: kPrimaryGreen,
                      ),
                      onChanged: (onChangeVal) {
                        setState(() {
                          selectedCard = onChangeVal!;
                        });
                        checkout.creditCardId = onChangeVal!.creditCardId;
                      },
                      items: checkout.creditCards!
                          .map<DropdownMenuItem<CreditCardDto>>(
                              (CreditCardDto value) {
                        return DropdownMenuItem<CreditCardDto>(
                          value: value,
                          child: Text(
                              ' ${value.creaditCartNumber}   ${value.cvc}   ${value.expirationDate!.month.toString().padLeft(2, '0')}/${value.expirationDate!.year.toString().substring(2)}                      '),
                        );
                      }).toList(),
                    )
                  : Text(''),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderDelivery extends StatefulWidget {
  @override
  State<OrderDelivery> createState() => _OrderDeliveryState();
}

class _OrderDeliveryState extends State<OrderDelivery> {
  DeliveryDto? selectedValue;
  @override
  void initState() {
    Provider.of<Checkout>(context, listen: false).getDeliveries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<Checkout>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Row(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(16.0),
          ),
          DropdownButton<DeliveryDto>(
            hint: Text('Select a delivery'),
            value: selectedValue,
            icon: Icon(
              Icons.local_shipping,
            ),
            elevation: 16,
            style: const TextStyle(
              color: Colors.black,
            ),
            underline: Container(
              height: 2,
              color: kPrimaryGreen,
            ),
            onChanged: (onChangedVal) {
              setState(() {
                selectedValue = onChangedVal!;
              });
              checkout.deliveryId = null;
              checkout.deliveryId = onChangedVal?.deliveryId;
            },
            items: checkout.deliveryItems!
                .map<DropdownMenuItem<DeliveryDto>>((value) {
              return DropdownMenuItem<DeliveryDto>(
                value: value,
                child: Text(
                    '${truncate(value.title ?? 'Missing', 25, addToEnd: '...')}                            '),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatefulWidget {
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  DeliveryDto? selectedValue;
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<Order>(context).order;
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Subtotal: ${details?.subTotal ?? 0}',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            'Product tax amount: ${details?.productTaxAmount ?? 0}',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
              'Product discount amount: ${details?.productDiscountAmount ?? 0}'),
          const SizedBox(height: 10),
          Text('Order tax amount: ${details?.orderTaxAmount ?? 0}'),
          const SizedBox(height: 10),
          Text('Order discount amount: ${details?.orderDiscountAmount ?? 0}'),
          const SizedBox(height: 10),
          Text('Payment fee amount: ${details?.paymentFeeAmount ?? 0}'),
          const SizedBox(height: 10),
          Text('Shipping fee amount: ${details?.shippingFeeAmount ?? 0}'),
          const SizedBox(height: 10),
          Text('Payment method: ${details?.paymentMethod ?? ''}'),
          const SizedBox(height: 10),
          Text('Shipping method: ${details?.shippingMethod ?? ''}'),
          const SizedBox(height: 10),
          Text(
              'Status: ${details?.payedAndClosed != null ? details!.payedAndClosed! ? 'Payed and closed' : 'Open' : ''}'),
          const SizedBox(height: 10),
          Text(
              'Created: ${details?.sysCreatedAt != null ? DateFormat('yyyy-MM-dd – kk:mm').format(details!.sysCreatedAt!) : ''}'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
