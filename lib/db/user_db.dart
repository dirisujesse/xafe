import 'package:hive/hive.dart';

class UserDb {
  // final SmsVerificationResponse _data = SmsVerificationResponse();

  static UserDb? _instance;

  static UserDb get instance {
    if (_instance == null) {
      _instance = UserDb();
    }
    return _instance!;
  }

  Box get _userDataBox => Hive.box('user_data');

  // setUserData({
  //   String? firstName,
  //   String? lastName,
  //   String? phone,
  //   String? email,
  //   bool? isLandlord,
  //   bool? isTenant,
  // }) {
  //   _data
  //     ..firstName = firstName ?? _data.firstName
  //     ..lastName = lastName ?? _data.lastName
  //     ..phone = phone ?? _data.phone
  //     ..email = email ?? _data.email
  //     ..isLandlord = isLandlord ?? _data.isLandlord
  //     ..isTenant = isTenant ?? _data.isTenant;

  //   _userDataBox.putAll(_data.toJson());
  // }

  void clearUserData() {
    _userDataBox.deleteAll([
      'firstName',
      'lastName',
      'phone',
      'email',
      'isLandlord',
      'isTenant',
    ]);
  }

  Map get userData {
    return {
      'firstName': _userDataBox.get('firstName'),
      'lastName': _userDataBox.get('lastName'),
      'phone': _userDataBox.get('phone'),
      'email': _userDataBox.get('email'),
      'isLandlord': _userDataBox.get('isLandlord'),
      'isTenant': _userDataBox.get('isTenant'),
    };
  }
}
