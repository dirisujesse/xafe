import 'package:xafe/models/enums/env.dart';

class AppConfig {
  static bool? _isMock;
  static Environment? _env;

  static init({
    bool isMock = false,
    Environment env = Environment.DEVELOPMENT,
  }) {
    _isMock = isMock;
    _env = env;
  }

  static bool get isMock {
    return _isMock ?? false;
  }

  static String get baseUrl {
    if (_env == Environment.DEVELOPMENT) return "https://dev.example.com";
    return "https://example.com";
  }
}
