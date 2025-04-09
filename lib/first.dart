import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vastraa/Constants/route_constant.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () => Get.toNamed(RouteConstant.secondScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('First'),
        centerTitle: true,
      ),
    );
  }
}
