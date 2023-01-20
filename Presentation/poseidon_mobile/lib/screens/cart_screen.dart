import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart' show Cart;
import 'package:openapi/widgets/cart_header.dart';
import 'package:openapi/widgets/cart_item.dart';
import 'package:openapi/widgets/order_dialog.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Cart>(context, listen: false).loadActiveCartOrCreate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      height: MQuery.height - 80,
      child: Column(
        children: <Widget>[
          CartHeader(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartListItem(
                  cartItemId: cart.items[i].cartItemId!,
                  productId: cart.items[i].productId!,
                  price: cart.items[i].price!,
                  quantity: cart.items[i].quantity!,
                  discountAmount: cart.items[i].discountAmount,
                  taxAmount: cart.items[i].taxAmount,
                  title: cart.items[i].title!,
                  unit: cart.items[i].unit ?? 'kg/pcs',
                  imageUrl: cart.items[i].imageUrl,
                  isSelected: i == 0 ? true : false),
            ),
          ),
          OrderButton(disabled: cart.items.length > 0 ? false : true)
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  final bool disabled;
  const OrderButton({Key? key, required this.disabled}) : super(key: key);

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  OrderDto? details = null;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Checkout'),
      onPressed: widget.disabled
          ? null
          : () {
              showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.6),
                transitionDuration: const Duration(milliseconds: 200),
                context: context,
                pageBuilder: (context, _, __) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: OrderDialog(),
                  );
                },
                transitionBuilder: (_, animation1, __, child) {
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    ).animate(animation1),
                    child: child,
                  );
                },
              );
            },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // <-- Radius
        ),
      ),
    );
  }
}
