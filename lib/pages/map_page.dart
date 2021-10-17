import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapchat_ui/theme/colors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(20.7132, 76.5651),
    zoom: 15.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: black.withOpacity(0.2)),
                    child: Icon(
                      Icons.person,
                      color: primary,
                      size: 28,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: black.withOpacity(0.2)),
                    child: Icon(
                      Icons.search,
                      color: darkGrey,
                      size: 23,
                    ),
                  )
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(boxShadow: [
              //     BoxShadow(
              //       color: darkGrey.withOpacity(0.50),
              //       spreadRadius: 20,
              //       blurRadius: 40,
              //       // changes position of shadow
              //     ),
              //   ]),
              //   child: Text(
              //     "Manoj",
              //     style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black87,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.3)),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 23,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      zoomControlsEnabled: false,
    );
  }
}
