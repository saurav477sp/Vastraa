import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vastraa/Constants/route_constant.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('GeoCoder'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(),
          OutlinedButton(
            onPressed: () {
              // final cordinates = Coordinates(
              //   23.10890281373597,
              //   72.54286590519875,
              // );
              var data = placemarkFromCoordinates(23.107955486264945, 72.54235092105885);
              print(
                '${placemarkFromCoordinates(23.107955486264945, 72.54235092105885)};',
              );
              print('data is $data');
            },
            child: Text('click'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteConstant.googleMapScreen),
        child: Icon(Icons.map_outlined),
      ),
    );
  }
}
