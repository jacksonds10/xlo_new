import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({this.title, this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.w700),
          ),
          Text(
            '$subtitle',
            style: TextStyle(color: Colors.grey,
            fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
