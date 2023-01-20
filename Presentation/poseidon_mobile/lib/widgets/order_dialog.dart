import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/checkout.dart';
import 'package:openapi/providers/order.dart';
import 'package:openapi/screens/orders_screen.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/checkout_card.dart';
import 'package:openapi/widgets/close_button.dart';
import 'package:provider/provider.dart';

class OrderDialog extends StatefulWidget {
  final Function()? onPressed;
  const OrderDialog({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  _OrderDialogState createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  OrderDto? details = null;
  int? deliveryId = null;
  String? paymentMethod = null;
  bool orderPayed = false;
  bool validSelection = true;
  String buttonText = 'Place an order';
  String status = '';
  @override
  void initState() {
    Provider.of<Checkout>(context, listen: false).getUserCreditCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    final cart = Provider.of<Cart>(context);
    final checkout = Provider.of<Checkout>(context);

    return Container(
      height: 600,
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Material(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                details != null ? 'Order total ' : 'Place an order ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
              Text(
                details != null ? details!.orderTotal!.toStringAsFixed(2) : '',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
              Spacer(),
              if (details != null)
                TextButton(
                    child: Text('Orders'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderScreen()),
                      );
                    }),
              CustomCloseButton(
                  size: 32,
                  onPress: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (details != null) const SizedBox(height: 20),
                  if (details != null)
                    CheckoutCard(
                      title: 'Details',
                      secTitle: '',
                    ),
                  const SizedBox(height: 20),
                  CheckoutCard(
                    title: 'Delivery',
                    secTitle: 'Select Method',
                  ),
                  const SizedBox(height: 16),
                  CheckoutCard(
                    title: 'Payment',
                    secTitle: 'Add or Choose',
                  ),
                  const SizedBox(height: 20),
                  if (!validSelection)
                    Text('Please select correct delivery and credit card'),
                  const SizedBox(height: 20),
                  Text(
                      'By placing an order you agree to our terms and conditions'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text(buttonText),
                    onPressed: () async {
                      int? cartId = cart.cartDetails?.cartId;
                      if (cartId == null) {
                        throw Exception(
                            "Missing cart id not able to create an order");
                      } else {
                        if (details == null) {
                          var result = await order.orderCheckout(
                              cartId, deliveryId, paymentMethod);
                          setState(() {
                            details = result;
                            if (details != null &&
                                details!.payedAndClosed == false) {
                              setState(() {
                                buttonText = 'Pay with stripe';
                              });
                            }
                          });
                        } else {
                          if (checkout.creditCardId == null ||
                              checkout.deliveryId == null) {
                            setState(() {
                              validSelection = false;
                            });
                          } else {
                            setState(() {
                              validSelection = true;
                            });

                            order.orderStripePayment(details!.orderId!,
                                checkout.creditCardId!, checkout.deliveryId!);

                            setState(() {
                              details = null;
                            });
                            // reload cart
                            cart.loadActiveCartOrCreate();
                            // close dialog
                            Navigator.of(context, rootNavigator: true).pop();
                            // show status message
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Order payed and closed',
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      }
                    },
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
