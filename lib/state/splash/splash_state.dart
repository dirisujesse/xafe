import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:xafe/services/storage/storage_service.dart';

class SplashState extends ChangeNotifier {
  static SplashState? _instance;

  static SplashState get instance {
    if (_instance == null) {
      _instance = SplashState();
    }
    return _instance ?? SplashState();
  }

  bool get isLoggedIn {
    bool? loginStatus = LocalStorage.getItem(
      LocalStorage.isLoggedIn,
      defaultValue: false,
    ) as bool?;
    return loginStatus ?? false;
  }
}
