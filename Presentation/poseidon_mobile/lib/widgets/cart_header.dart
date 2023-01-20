import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/screens/user_tab_screen.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:provider/provider.dart';

class CartHeader extends StatefulWidget {
  const CartHeader({Key? key}) : super(key: key);

  @override
  State<CartHeader> createState() => _CartHeaderState();
}

class _CartHeaderState extends State<CartHeader> {
  bool _expanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<Cart>(context, listen: false).loadActiveCartOrCreate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context).cartDetails;

    return GestureDetector(
      onTap: () => {},
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
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(
                      getProportionateScreenWidth(8.0),
                    ),
                    decoration: ShapeDecoration(
                      color: kAccentGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(4.0),
                        ),
                      ),
                    ),
                    child: Image.asset('assets/images/ui/cart_nav_fill.png')),
                SizedBox(
                  width: getProportionateScreenWidth(20.0),
                ),
                Expanded(
                  child: Text('Total ${cart!.total ?? 0}',
                      style: Theme.of(context).textTheme.headline5),
                ),
                InkWell(
                  child: RotatedBox(
                    quarterTurns: _expanded ? 3 : 0,
                    child: Icon(Icons.chevron_right),
                  ),
                  onTap: () => setState(() => {_expanded = !_expanded}),
                ),
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: ConstrainedBox(
                  constraints: _expanded
                      ? BoxConstraints()
                      : BoxConstraints(maxHeight: 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(16.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16.0),
                        ),
                        child: Column(
                          children: [
                            InputFormCard(
                              title: 'Total',
                              value: '${cart.total ?? 0}',
                            ),
                            InputFormCard(
                              title: 'Discount amount',
                              value: '${cart.discountAmount ?? 0}',
                            ),
                            InputFormCard(
                              title: 'Tax amount',
                              value: '${cart.taxAmount ?? 0}',
                            ),
                            InputFormCard(
                              title: 'Active',
                              value: '${cart.isActive! ? 'Yes' : 'No'}',
                            ),
                            InputFormCard(
                              title: 'Created at',
                              value:
                                  '${DateFormat('yyyy-MM-dd – kk:mm').format(cart.sysCreatedAt!)}',
                            ),
                            InputFormCard(
                              title: 'Updated at',
                              value:
                                  '${DateFormat('yyyy-MM-dd – kk:mm').format(cart.sysUpdatedAt!)}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
