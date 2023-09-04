import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  LocationData? myCurrentLocation;

  void getMyLocation() async{
    await Location.instance.requestPermission();
    await Location.instance.hasPermission();
    myCurrentLocation = await Location.instance.getLocation();
    print(myCurrentLocation);
    if(mounted){
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Location"),
      ),
        body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 15,
            bearing: 30,
            tilt: 10,
            target: LatLng(24.250151813382207, 89.92231210838047),
    ),
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){
          getMyLocation();
        },
    ),
    );
  }
}
