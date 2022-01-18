import 'package:ecourse/ui/widgets/tag_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseTag extends StatelessWidget {

  final String label;

  CourseTag({ required this.label });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TagClipper(),
      child: Container(
        padding: EdgeInsets.fromLTRB(6, 6, 12, 4),
        color: Colors.yellow,
        child: Text(
          this.label,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}