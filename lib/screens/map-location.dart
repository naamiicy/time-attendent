import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:time_attendent_app/models/user-position-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

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
  Placemark _listPlace;
  String _addressText;
  String _addressSnippet;

  //***Set User***//
  UserPosition _userPosition;

  @override
  void initState() {
    super.initState();
    getLocationUser();
  }

  void getLocationUser() async {
    _position = await _geolocator.getCurrentPosition();
    _userPosition = UserPosition(
      latitude: _position.latitude,
      longitude: _position.longitude,
    );

    if (_position != null) {
      setState(() {
        _startPosition = LatLng(_position.latitude, _position.longitude);
        _lastPostion = _startPosition;
      });
    } else {
      return;
    }
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  Set<Marker> _onSetMarkers() {
    // setState(() {
    _markers = Set<Marker>.from([
      Marker(
        markerId: MarkerId(_startPosition.toString()),
        position: _startPosition,
      )
    ]).toSet();
    // });
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
          : Stack(
              // child: Stack(
              children: <Widget>[
                // Container(
                //   height: MediaQuery.of(context).size.height - 50.0,
                //   width: MediaQuery.of(context).size.width,
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _startPosition,
                    zoom: 16.0,
                  ),
                  markers: Set.from(_markers),
                  onMapCreated: _onMapCreated,
                  zoomGesturesEnabled: true, //ซูม
                  // myLocationEnabled: true, //แสดงพิกัด
                  // compassEnabled: true, //แสดงเข็มทิศ
                  onCameraMove: _onCameraMove,
                ),
                // Card(
                //   child: Column(children: <Widget>[
                //     ListTile(
                //       leading: Icon(Icons.location_on),
                //       title: Text('testtttttttttttttttttttttttttttt'),
                //       subtitle: Text('textttttt tyytyr.'),
                //     ),
                //   ]),
                // )
                // ),
              ],
            ),
    );
  }
}
