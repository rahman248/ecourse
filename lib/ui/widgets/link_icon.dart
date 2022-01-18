import 'package:flutter/material.dart';

class LinkIcon extends StatelessWidget {
  final String imageSrc;
  final double width;
  final double height;
  final Function()? onTap;

  LinkIcon({
    required this.imageSrc,
    required this.width,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imageSrc,
        width: width,
        height: height,
      ),
    );
  }
}