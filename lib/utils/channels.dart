import 'package:flutter/services.dart';

class XfChannels {
  static MethodChannel _channel = new MethodChannel('co.Xafe.app');

  static Future<String?> appVersion() async {
    try {
      return await _channel.invokeMethod<String?>("app_version");
    } catch(e) {
      throw e;
    }
  }
}