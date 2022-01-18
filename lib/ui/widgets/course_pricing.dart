
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoursePricing extends StatelessWidget {
  final double price;
  final double originalPrice;

  CoursePricing({
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            NumberFormat.simpleCurrency(decimalDigits: 0).format(price),
            style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 28),
          ),
        ),
        Text(
          NumberFormat.simpleCurrency(decimalDigits: 0).format(originalPrice),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough,
            color: Color(0xFF61688B),
          ),
        ),
      ],
    );
  }
}