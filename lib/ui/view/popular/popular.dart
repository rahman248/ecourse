
import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  final Function()? callBack;
  const PopularScreen({Key? key, this.callBack}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> with TickerProviderStateMixin {

  AnimationController? animationController;


  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

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