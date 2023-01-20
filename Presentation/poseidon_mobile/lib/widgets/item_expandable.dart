import 'package:flutter/material.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/common.dart';

class Expandable extends StatefulWidget {
  final String title;
  final String? description;
  final Widget? trailing;

  const Expandable({
    Key? key,
    required this.title,
    this.description,
    this.trailing,
  }) : super(key: key);

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: kTitleStyle),
              Spacer(),
              if (widget.trailing != null) widget.trailing!,
              InkWell(
                child: RotatedBox(
                  quarterTurns: _expanded ? 3 : 0,
                  child: Icon(Icons.chevron_right),
                ),
                onTap: () => setState(() => _expanded = !_expanded),
              ),
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            child: ConstrainedBox(
              constraints: _expanded
                  ? BoxConstraints(maxHeight: 400)
                  : BoxConstraints(maxHeight: 0),
              child: Text(
                widget.description != null
                    ? rmNewline(widget.description!)
                    : 'Not Available',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
