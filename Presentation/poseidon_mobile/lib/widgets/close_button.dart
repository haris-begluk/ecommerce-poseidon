import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/utils/screen_utils.dart';

class CustomCloseButton extends StatelessWidget {
  final Function()? onPress;
  final double size;
  final Color color;
  const CustomCloseButton(
      {Key? key, this.onPress, this.size = 20, this.color = kPrimaryWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(size),
      child: RawMaterialButton(
        fillColor: color,
        elevation: 0,
        constraints: BoxConstraints.tightFor(
          width: getProportionateScreenWidth(size),
          height: getProportionateScreenWidth(size),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
        ),
        onPressed: onPress,
        child: Icon(
          Icons.close,
          color: kGreyShade1,
          size: size / 2,
        ),
      ),
    );
  }
}
