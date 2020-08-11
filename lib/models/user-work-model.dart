import 'package:time_attendent_app/models/user-address-model.dart';

class UserWork {
  final String workType;
  final DateTime workDate;
  final UserAddress userAddress;

  UserWork({
    this.workType,
    this.workDate,
    this.userAddress,
  });
}
