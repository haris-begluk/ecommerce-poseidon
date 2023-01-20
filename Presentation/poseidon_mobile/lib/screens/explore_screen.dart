import 'package:flutter/material.dart';
import 'package:openapi/screens/explore_tab_screen.dart';

class ExploreScreen extends StatelessWidget {
  static const routeName = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ExploreOverviewScreen(),
          )
        ],
      ),
    );
  }
}
