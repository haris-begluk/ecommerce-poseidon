import 'package:flutter/material.dart';
import 'package:openapi/common.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/screens/explore_screen.dart';
import 'package:openapi/widgets/banners.dart';
import 'package:openapi/widgets/deal_card.dart';
import 'package:openapi/widgets/explore_item.dart';
import 'package:openapi/widgets/tab_title.dart';
import 'package:provider/provider.dart';

import '../utils/screen_utils.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    Provider.of<Products>(context, listen: false).getAllOffers();
    Provider.of<Products>(context, listen: false)
        .getRecommendationOrBestSellers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 8),
        HomeAppBar(),
        SizedBox(height: 8),
        Banners(),
        SizedBox(height: 8),
        DealsTab(),
        SizedBox(height: 8),
        RecomendedTab(),
      ],
    );
  }
}

class RecomendedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Products>(context);
    return Container(
      height: MQuery.height * 0.3,
      child: Column(children: [
        TabTitle(
            title: product.recommendation ? 'Recommendation' : 'Best sellers',
            seeAll: () {}),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemCount: product.bestSellers.length,
            itemBuilder: (_, i) => ExploreItem(
                item: product.bestSellers[i],
                favorite: product.isFavorite(product.bestSellers[i].productId)),
            separatorBuilder: (_, __) => SizedBox(width: 10),
          ),
        ),
      ]),
    );
  }
}

class DealsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Products>(context);

    return Container(
      height: MQuery.height * 0.3,
      child: Column(
        children: [
          TabTitle(title: 'Exclusive Offers', seeAll: () {}),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              scrollDirection: Axis.horizontal,
              itemCount: product.offers.length,
              itemBuilder: (_, i) => new DealCard(
                offerId: product.offers[i].discountOfferId!,
                title: truncate(
                    '${(product.offers[i].discount ?? 0).round()}% Off ${product.offers[i].title ?? 'This weeek'}',
                    20,
                    addToEnd: "..."),
                shortDetails:
                    product.offers[i].description ?? 'Check our offer',
                isHorizontalScrolling: true,
              ),
              separatorBuilder: (_, __) => SizedBox(width: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          16,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Poseidon',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  'Thanks for using our service',
                  style: TextStyle(
                    color: kTextColorAccent,
                    fontSize: getProportionateScreenWidth(
                      12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ExploreScreen.routeName);
            },
            child: Icon(
              Icons.search,
              color: kPrimaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
