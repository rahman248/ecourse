import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {

  final String message;

  const ErrorMessage({Key? key, this.message = 'Ups, something is bad happening,\nplease try again later.'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}