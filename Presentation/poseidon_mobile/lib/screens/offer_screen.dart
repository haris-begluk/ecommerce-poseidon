import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/offer_item.dart';
import 'package:provider/provider.dart';

class OfferScreen extends StatefulWidget {
  static const routeName = '/offer';

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          Provider.of<Products>(context, listen: false).getOfferProducts(),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final offerId = Provider.of<Products>(context).offerId;
    final productProvider = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Discount offer (${offerId})'),
      ),
      body: Container(
        height: MQuery.height - 80,
        child: Column(
          children: [
            Center(
              child: Card(
                child: SizedBox(
                  width: getProportionateScreenWidth(375),
                  height: 50,
                  child: Center(
                      child: Text(
                    productProvider.wishList?.wishListItem!.length == 0
                        ? 'Discount offer is empty'
                        : 'Discount offer products',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                  )),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: productProvider.offersProducts.length,
                itemBuilder: (_, i) => OfferItem(
                    item: productProvider.offersProducts[i], favorite: false),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.56 / 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
