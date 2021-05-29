import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const String isLoggedIn = "isLoggedIn";
  static const String countries = "countries";
  static const String firstTimeUser = "firstTimeUser";
  static const String userData = "userData";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String tokenCreationTime = "createdAt";
  static const String mobileNumber = "mobileNumber";

  ///Box name.
  static const String boxUserData = "user_data";
  static String boxAppData = "app_data";

  //UserData [Key].
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";

  static Future<void> setupHive() async {
    await Hive.initFlutter();

    ///Open Boxes
    await Hive.openBox(boxAppData);
    await Hive.openBox(boxUserData);
  }

  static FutureOr<bool> removeItem(
    String key, {
    String? boxName,
  }) async {
    try {
      await Hive.box(boxName ?? boxAppData).delete(key);
      return true;
    } catch (e) {
      return false;
    }
  }

  static FutureOr<dynamic> getItem(
    String key, {
    String? boxName,
    dynamic defaultValue,
  }) {
    try {
      final value =
          Hive.box(boxName ?? boxAppData).get(key, defaultValue: defaultValue);
      return value;
    } catch (e) {
      return false;
    }
  }

  static FutureOr<bool> setItem({
    String? boxName,
    required String key,
    required dynamic value,
  }) async {
    try {
      await Hive.box(boxName ?? boxAppData).put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static FutureOr<bool> setItems(
    Map<String, dynamic> data, {
    String? boxName,
  }) async {
    try {
      await Hive.box(boxName ?? boxAppData).putAll(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static FutureOr<bool> removeItems(
    List<String> keys, {
    String? boxName,
  }) async {
    try {
      await Hive.box(boxName ?? boxAppData).deleteAll(keys);
      return true;
    } catch (e) {
      return false;
    }
  }
}
