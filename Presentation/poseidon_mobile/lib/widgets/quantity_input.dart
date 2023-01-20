import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/utils/screen_utils.dart';

class SmallQuantityInput extends StatelessWidget {
  const SmallQuantityInput({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(32),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          isCollapsed: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8),
            ),
            borderSide: BorderSide(
              color: kGreyShade3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8),
            ),
            borderSide: BorderSide(
              color: kGreyShade3,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(6),
            horizontal: getProportionateScreenWidth(4),
          ),
        ),
        style: TextStyle(
          fontSize: getProportionateScreenWidth(15),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
