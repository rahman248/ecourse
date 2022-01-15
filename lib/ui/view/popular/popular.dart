
import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.green,
      child: Center(
        child: Text("PopularScreen"),
      ),
    );
  }
  
}