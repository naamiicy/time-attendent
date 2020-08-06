import 'package:geolocator/geolocator.dart';
import 'package:time_attendent_app/models/user-position-model.dart';

class UserAddress {
  final String administrativeArea; //สมุทรปราการ
  final String country; //ประเทศไทย
  final String isoCountryCode; //TH
  final String locality; //ตำบล สำโรงเหนือ
  final String name; //617
  final UserPosition position; //13.645109999999999, 100.62469039999999
  final String postalCode; //10270
  final String subAdministrativeArea; //อำเภอเมืองสมุทรปราการ
  final String subLocality; //''
  final String subThoroughfare; //617
  final String thoroughfare; //แบริ่ง 58/6 แยก 2

  UserAddress(
      {this.administrativeArea,
      this.country,
      this.isoCountryCode,
      this.locality,
      this.name,
      this.position,
      this.postalCode,
      this.subAdministrativeArea,
      this.subLocality,
      this.subThoroughfare,
      this.thoroughfare});
}
