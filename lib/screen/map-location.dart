import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:time_attendent_app/widget/drawer-list.dart';

class MapLocation extends StatefulWidget {
  MapLocation({Key key}) : super(key: key);

  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();

  //***GetLocation***//
  Position _position;
  Geolocator _geolocator = Geolocator();
  static LatLng _startPosition;
  static LatLng _lastPostion = _startPosition;
  Set<Marker> _markers = {};
  List<Placemark> _place;
  String _addressSnippet;

  @override
  void initState() {
    super.initState();
    getLocationUser();
  }

  void getLocationUser() async {
    _position = await _geolocator.getCurrentPosition();
    // _place = await _geolocator.placemarkFromCoordinates(
    //     _position.latitude, _position.longitude);

    setState(() {
      _startPosition = LatLng(_position.latitude, _position.longitude);
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  onAddMarkers() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastPostion.toString()),
        position: _lastPostion,
        infoWindow: InfoWindow(
          title: '555',
          snippet: '2222',
          onTap: () {},
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastPostion = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Clocking GPS')),
      ),
      drawer: DrawerList(),
      body: _startPosition == null
          ? Container(
              child: Center(
                child: Text(
                  'Loading map..',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            )
          : Container(
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _startPosition,
                      zoom: 16.0,
                    ),
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    zoomGesturesEnabled: true, //ซูม
                    // myLocationEnabled: true, //แสดงพิกัด
                    // compassEnabled: true, //แสดงเข็มทิศ
                    onCameraMove: _onCameraMove,
                  ),
                  // Card(
                  //   color: Colors.white70,
                  //   child: ListTile(
                  //     leading: Icon(Icons.location_on),
                  //     title: Text('$addressTtitle'),
                  //     subtitle: Text('$addressSnippet'),
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
}
