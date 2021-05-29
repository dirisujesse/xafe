import 'package:flutter/foundation.dart' show ChangeNotifier;
// import 'package:xafe/models/config/app_config.dart';
// import 'package:xafe/services/http/auth/auth_contract.dart';
// import 'package:xafe/services/http/auth/auth_http_service.dart';
// import 'package:xafe/services/http/auth/auth_mock_service.dart';

class AuthState extends ChangeNotifier {
  static AuthState? _instance;
  // late AuthService _authService;

  AuthState() {
    // _authService = AppConfig.isMock ? AuthMockService() : AuthHttpService();
  }

  static AuthState get instance {
    if (_instance == null) {
      _instance = AuthState();
    }
    return _instance ?? AuthState();
  }
}
