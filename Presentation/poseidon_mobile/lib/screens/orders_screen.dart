import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/order.dart';
import 'package:openapi/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Provider.of<Order>(context, listen: false).getUserOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders (${order.userOrders.length})',
          style: kTitleStyle,
        ),
      ),
      body: Container(
        height: MQuery.height - 80,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: order.userOrders.length,
                itemBuilder: (ctx, i) =>
                    OrderItem(order: order.userOrders[i], isSelected: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
