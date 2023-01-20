import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/utils/screen_utils.dart';

class ImageContainer extends StatelessWidget {
  final String? imageUrl;
  const ImageContainer({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(112),
      width: getProportionateScreenWidth(112),
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: kGreyShade5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox.fromSize(
                size: Size.fromRadius(80), // Image radius
                child: Image.network(imageUrl ?? 'assets/images/ui/avatar.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8),
              ),
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: kPrimaryGreen,
              ),
              child: Image.asset('assets/images/ui/camera.png'),
            ),
          )
        ],
      ),
    );
  }
}
