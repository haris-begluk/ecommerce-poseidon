import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/custom-model/models.dart';
import 'package:openapi/providers/cart.dart';
import 'package:openapi/providers/filter.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/explore_item.dart';
import 'package:openapi/widgets/filter_dialog.dart';
import 'package:provider/provider.dart';

class ExploreOverviewScreen extends StatefulWidget {
  static const routeName = '/explore-overview';

  @override
  _ExploreOverviewState createState() => _ExploreOverviewState();
}

class _ExploreOverviewState extends State<ExploreOverviewScreen> {
  Timer? _debounce;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          Provider.of<Products>(context, listen: false).getWishListForUser(),
          Provider.of<Products>(context, listen: false).fetchAndSetProducts(),
          Provider.of<Cart>(context, listen: false).loadActiveCartOrCreate()
        });
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    final productProvider = Provider.of<Products>(context);
    final filterProps = Provider.of<Filter>(context);
    double size = 33;

    return Container(
      height: MQuery.height - 80,
      child: Column(
        children: [
          SizedBox(height: 10),
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: getProportionateScreenWidth(350),
                  child: SearchBox(
                    onChangeHandler: (val) {
                      if (val.isNotEmpty) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();

                        _debounce =
                            Timer(const Duration(milliseconds: 200), () {
                          String filter = '';
                          if (filterProps.filter.name && val.isNotEmpty) {
                            filter +=
                                '${filter.isNotEmpty ? '|' : ''}name=*$val';
                          }
                          if (filterProps.filter.description &&
                              val.isNotEmpty) {
                            filter +=
                                '${filter.isNotEmpty ? '|' : ''}description=*$val';
                          }
                          if (filterProps.filter.gtin && val.isNotEmpty) {
                            filter +=
                                '${filter.isNotEmpty ? '|' : ''}gtin=*$val';
                          }
                          if (filterProps.filter.number && val.isNotEmpty) {
                            filter +=
                                '${filter.isNotEmpty ? '|' : ''}number=*$val';
                          }
                          if (filterProps.filter.price && val.isNotEmpty) {
                            if (double.tryParse(
                                  val,
                                ) !=
                                null) {
                              double number = double.parse(val);
                              ++number;
                              filter +=
                                  '${filter.isNotEmpty ? '|' : ''}price>$val,price<$number';
                            }
                          }
                          String orderBy = '';
                          if (filterProps.filter.orderUpdated)
                            orderBy +=
                                '${orderBy.isNotEmpty ? ',' : ''}sys_UpdatedAt ${filterProps.filter.desc ? 'desc' : 'asc'}';

                          if (filterProps.filter.orderName)
                            orderBy +=
                                '${orderBy.isNotEmpty ? ',' : ''}name ${filterProps.filter.desc ? 'desc' : 'asc'}';

                          productProvider.getProductsByQuery(Query(
                              page: 1,
                              pageSize: 100,
                              orderBy: orderBy,
                              filter: filter));
                        });
                      } else {
                        productProvider.getProductsByQuery(Query(
                            page: 1,
                            pageSize: 100,
                            orderBy: 'sys_UpdatedAt desc',
                            filter: null));
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: getProportionateScreenWidth(size),
                  child: TextButton(
                    onPressed: () {
                      showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.6),
                        transitionDuration: const Duration(milliseconds: 200),
                        context: context,
                        pageBuilder: (context, _, __) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: FilterDialog(),
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
                    child: Icon(
                      Icons.sort,
                      color: Colors.black,
                      size: size / 1.5,
                    ),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 4),
                        textStyle: const TextStyle(fontSize: 30),
                        shadowColor: Colors.transparent),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: productProvider.items.length,
              itemBuilder: (_, i) => ExploreItem(
                  item: productProvider.items[i],
                  favorite: productProvider
                      .isFavorite(productProvider.items[i].productId!)),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.56 / 1.815,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final Function(String) onChangeHandler;
  const SearchBox({Key? key, required this.onChangeHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 40,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: onChangeHandler,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Explore...',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
        ],
      ),
    );
  }
}
