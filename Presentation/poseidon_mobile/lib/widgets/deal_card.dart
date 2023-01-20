import 'package:flutter/material.dart';
import 'package:openapi/common.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/products.dart';
import 'package:openapi/screens/offer_screen.dart';
import 'package:provider/provider.dart';
import '../utils/screen_utils.dart';

class DealCard extends StatelessWidget {
  final int offerId;
  final String title;
  final String shortDetails;
  final bool isHorizontalScrolling;

  const DealCard(
      {required this.offerId,
      required this.title,
      required this.shortDetails,
      this.isHorizontalScrolling = true});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Provider.of<Products>(context, listen: false).setOfferId(offerId),
        Navigator.pushNamed(context, OfferScreen.routeName)
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        width: getProportionateScreenWidth(350),
        height: getProportionateScreenHeight(170),
        margin: EdgeInsets.only(
          left: isHorizontalScrolling
              ? getProportionateScreenWidth(16)
              : getProportionateScreenWidth(0),
          bottom: !isHorizontalScrolling
              ? getProportionateScreenHeight(32)
              : getProportionateScreenHeight(0),
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(
                8,
              ),
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              kPrimaryWhite,
              kPrimaryGreen.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            getProportionateScreenWidth(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                FallbackDiscountImage,
                fit: BoxFit.contain,
                height: 100,
              ),
              Text(
                truncate(rmNewline(title), 20, addToEnd: '...'),
                style: TextStyle(
                  color: kGradientColor,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                truncate(rmNewline(shortDetails), 20, addToEnd: '...'),
                style: TextStyle(
                  color: kGradientColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
