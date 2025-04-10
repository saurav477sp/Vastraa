import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _contoller = Completer();
  TextEditingController cordinatesController = TextEditingController();
  LatLng location = LatLng(23.15053721001964, 72.47166850239087);
  List<Marker> markers = [];
  final List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(23.15053721001964, 72.47166850239087),
      infoWindow: InfoWindow(title: 'firt'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(23.15053721001964, 73.481667630239087),
      infoWindow: InfoWindow(title: 'second'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(23.16053721001964, 72.481667630239087),
      infoWindow: InfoWindow(title: 'third'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  ];


  RxBool isfullScreenMap = false.obs;

  @override
  void initState() {
    super.initState();
    markers.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.3;
    double width = size.width;
    return Scaffold(
      appBar:
          isfullScreenMap.value
              ? null
              : AppBar(
                backgroundColor: Colors.green,
                title: Text('Map'),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: cordinatesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onEditingComplete: () {},
            ),
          ),
          Text(cordinatesController.text),
          Container(
            height: isfullScreenMap.value ? size.height : height,
            width: isfullScreenMap.value ? size.width : width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  compassEnabled: true,
                  markers: Set.of(markers),
                  myLocationButtonEnabled: true,
                  indoorViewEnabled: true,
                  mapToolbarEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: location,
                    zoom: 14,
                  ),
                  onMapCreated: (controller) {
                    _contoller.complete(controller);
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {
                        isfullScreenMap.value = !isfullScreenMap.value;
                        setState(() {});
                      },
                      icon:
                          isfullScreenMap.value
                              ? Icon(Icons.close_fullscreen)
                              : Icon(Icons.open_in_full_sharp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController mapController = await _contoller.future;
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: markers[1].position, zoom: 14),
            ),
          );
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
