import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const TextLink(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Text(
          text,
          style: kSubtitleStyle
        ),
      ),
    );
  }
}