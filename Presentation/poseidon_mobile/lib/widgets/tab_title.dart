import 'package:flutter/material.dart';
import 'package:openapi/utils/screen_utils.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final void Function() seeAll;
  final double padding;

  const TabTitle(
      {required this.title,
      required this.seeAll,
      this.actionText = '',
      this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          padding,
        ),
        vertical: 0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextButton(
            onPressed: seeAll,
            child: Text(
              actionText,
            ),
          ),
        ],
      ),
    );
  }
}
