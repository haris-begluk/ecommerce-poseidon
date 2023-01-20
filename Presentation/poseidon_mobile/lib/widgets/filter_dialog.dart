import 'package:flutter/material.dart';
import 'package:openapi/providers/filter.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/close_button.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatefulWidget {
  final Function()? onPressed;
  const FilterDialog({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    var filterProps = Provider.of<Filter>(context);
    var filter = filterProps.filter;
    return Container(
      height: 600,
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Search options',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20),
                  ),
                ),
                Spacer(),
                CustomCloseButton(
                    size: 35,
                    onPress: () {
                      filterProps.setProps(filter);
                      Navigator.pop(context);
                    }),
              ],
            ),
            Text(
              'Search propeties',
              textAlign: TextAlign.left,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.name,
              title: Text('Name'),
              onChanged: (value) {
                setState(() {
                  filter.name = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.description,
              title: Text('Description'),
              onChanged: (value) {
                setState(() {
                  filter.description = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.gtin,
              title: Text('GTIN'),
              onChanged: (value) {
                setState(() {
                  filter.gtin = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.number,
              title: Text('Product number'),
              onChanged: (value) {
                setState(() {
                  filter.number = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.price,
              title: Text('Product price'),
              onChanged: (value) {
                setState(() {
                  filter.price = value!;
                });
              },
            ),
            Text(
              'Order by propeties',
              textAlign: TextAlign.left,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.desc,
              title: Text('desc'),
              onChanged: (value) {
                setState(() {
                  filter.desc = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.orderUpdated,
              title: Text('Last updated time'),
              onChanged: (value) {
                setState(() {
                  filter.orderUpdated = value!;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: filterProps.filter.orderName,
              title: Text('Product name'),
              onChanged: (value) {
                setState(() {
                  filter.orderName = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
