import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:time_attendent_app/models/user-login-model.dart';

class UserEmployee {
  final String empID;
  final UserLogin userLogin;
  final String title;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String jobPosition;
  final String img;
  final UserAddress userAddress;

  UserEmployee({
    this.empID,
    this.userLogin,
    this.title,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.jobPosition,
    this.img,
    this.userAddress,
  });
}
