
import 'package:ecourse/ui/shared/shimmer.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class VideoCardShimmer extends StatelessWidget {
  const VideoCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: defaultPadding),
        AspectRatio(
          aspectRatio: 1.75,
          child: Shimmer(),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SizedBox(
            height: 20,
            child: Shimmer(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SizedBox(
            height: 20,
            child: Shimmer(),
          ),
        ),
      ],
    );
  }
}