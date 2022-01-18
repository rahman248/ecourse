import 'dart:ui';

import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:flutter/cupertino.dart';

class IconLabel extends StatelessWidget {

  late final String src;
  late final String label;

  IconLabel({
    required this.src,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          src,
          width: 14,
          height: 14,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 16),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}