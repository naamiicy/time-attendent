import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:time_attendent_app/widget/drawer-list.dart';
import 'package:time_attendent_app/models/user-location-model.dart';

class MapLocation extends StatefulWidget {
  MapLocation({Key key}) : super(key: key);

  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();
  UserLocation _currentLocation;
  LatLng _centerMap;
  // static const LatLng _centerMap = const LatLng(13.667708, 100.621809);
  // static final CameraPosition _myLocation = CameraPosition(
  //   target: _centerMap,
  //   zoom: 16.0,
  // );
  // final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getLocationUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Map',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: DrawerList(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          //Add Function check location
          target: LatLng(13.6640005, 100.5957369),
          zoom: 16.0,
        ),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        // markers: _onAddMarkerButtonPressed(),
      ),
    );
  }

  getLocationUser() async {
    var location = Location();
    var _userLocation = await location.getLocation();
    _currentLocation = UserLocation(
      latitude: _userLocation.latitude,
      longitude: _userLocation.longitude,
    );

    setState(() {
      _centerMap =
          LatLng(_currentLocation.latitude, _currentLocation.longitude);
      print(' _centerMap ::: ${_centerMap}');
      print('check _currentLocation.lat ====> : ${_currentLocation.latitude}');
      print('check _currentLocation.long ===> : ${_currentLocation.longitude}');
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  // _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId(_centerMap.toString()),
  //       position: _centerMap,
  //       infoWindow: InfoWindow(
  //         title: 'title : $_centerMap',
  //         snippet: 'snippet: $_centerMap',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }
}
