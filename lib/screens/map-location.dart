import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:time_attendent_app/models/user-auth-model.dart';
import 'package:time_attendent_app/models/user-position-model.dart';
import 'package:time_attendent_app/widgets/bottom-card.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';
import 'package:time_attendent_app/widgets/address-card.dart';

class MapLocation extends StatefulWidget {
  final UserAuthentication user;

  MapLocation({Key key, @required this.user}) : super(key: key);

  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();

  //***GetLocation***//
  Set<Marker> _markers = {};
  Geolocator _geolocator = Geolocator();
  Position _position;
  List<Placemark> _place;
  Placemark _listPlace;
  static LatLng _startPosition;
  static LatLng _lastPostion;

  //***Set User***//
  UserPosition _userPosition;
  UserAddress _userAddress;

  @override
  void initState() {
    super.initState();
    getLocationUser();
  }

  void getLocationUser() async {
    _position = await _geolocator.getCurrentPosition();
    _place = await _geolocator.placemarkFromCoordinates(
        _position.latitude, _position.longitude);
    _listPlace = _place[0];

    if (_position != null) {
      setState(() {
        _startPosition = LatLng(_position.latitude, _position.longitude);
        _lastPostion = _startPosition;

        _userPosition = UserPosition(
          latitude: _position.latitude,
          longitude: _position.longitude,
        );

        print('${_userPosition.latitude}, ${_userPosition.longitude}');

        _userAddress = UserAddress(
          administrativeArea: _listPlace.administrativeArea,
          country: _listPlace.country,
          isoCountryCode: _listPlace.isoCountryCode,
          locality: _listPlace.locality,
          name: _listPlace.name,
          position: UserPosition(
            latitude: _position.latitude,
            longitude: _position.longitude,
          ),
          postalCode: _listPlace.postalCode,
          subAdministrativeArea: _listPlace.subAdministrativeArea,
          subLocality: _listPlace.subLocality,
          subThoroughfare: _listPlace.subThoroughfare,
          thoroughfare: _listPlace.thoroughfare,
        );
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
    return _markers = Set<Marker>.from([
      Marker(
        markerId: MarkerId(_lastPostion.toString()),
        position: _lastPostion,
      )
    ]).toSet();
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
      drawer: DrawerList(getUser: widget.user),
      body: _startPosition == null
          ? Container(
              child: Center(
                child: Text(
                  'Loading map..',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          : Column(
              children: <Widget>[
                AddressCard(
                  userAddress: _userAddress,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 250.0,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _startPosition,
                          zoom: 16.0,
                        ),
                        markers: Set.from(_markers),
                        onMapCreated: _onMapCreated,
                        zoomGesturesEnabled: true, //ซูม
                        // myLocationEnabled: true,//แสดงพิกัด
                        // compassEnabled: true,   //แสดงเข็มทิศ
                        onCameraMove: _onCameraMove,
                      ),
                    ),
                  ],
                ),
                BottomCard(
                  userAddress: _userAddress,
                ),
              ],
            ),
    );
  }
}
